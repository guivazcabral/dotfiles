// Keeps a preferred microphone as the default input, re-asserting it whenever
// macOS switches away (e.g. when a headset connects). Event-driven via Core
// Audio property listeners — no polling.
//
// Usage: force-input-device "<name substring>"   (default: "QuadCast")

import CoreAudio
import Foundation

let wanted = (CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "QuadCast").lowercased()
let sys = AudioObjectID(kAudioObjectSystemObject)

let logPath = NSHomeDirectory() + "/Library/Logs/force-input-device.log"
func log(_ msg: String) {
    let line = "\(ISO8601DateFormatter().string(from: Date())) \(msg)\n"
    if let fh = FileHandle(forWritingAtPath: logPath) {
        fh.seekToEndOfFile(); fh.write(line.data(using: .utf8)!); fh.closeFile()
    } else {
        try? line.data(using: .utf8)!.write(to: URL(fileURLWithPath: logPath))
    }
    FileHandle.standardError.write(line.data(using: .utf8)!)
}

func addr(_ sel: AudioObjectPropertySelector,
          _ scope: AudioObjectPropertyScope = kAudioObjectPropertyScopeGlobal) -> AudioObjectPropertyAddress {
    AudioObjectPropertyAddress(mSelector: sel, mScope: scope, mElement: kAudioObjectPropertyElementMain)
}

func deviceIDs() -> [AudioDeviceID] {
    var a = addr(kAudioHardwarePropertyDevices)
    var size = UInt32(0)
    guard AudioObjectGetPropertyDataSize(sys, &a, 0, nil, &size) == noErr else { return [] }
    var ids = [AudioDeviceID](repeating: 0, count: Int(size) / MemoryLayout<AudioDeviceID>.size)
    guard AudioObjectGetPropertyData(sys, &a, 0, nil, &size, &ids) == noErr else { return [] }
    return ids
}

func deviceName(_ id: AudioDeviceID) -> String {
    var a = addr(kAudioObjectPropertyName)
    var name: Unmanaged<CFString>?
    var size = UInt32(MemoryLayout<Unmanaged<CFString>?>.size)
    guard AudioObjectGetPropertyData(id, &a, 0, nil, &size, &name) == noErr,
          let cf = name?.takeRetainedValue() else { return "" }
    return cf as String
}

func inputChannels(_ id: AudioDeviceID) -> Int {
    var a = addr(kAudioDevicePropertyStreamConfiguration, kAudioObjectPropertyScopeInput)
    var size = UInt32(0)
    guard AudioObjectGetPropertyDataSize(id, &a, 0, nil, &size) == noErr, size > 0 else { return 0 }
    let buf = UnsafeMutableRawPointer.allocate(byteCount: Int(size),
                                               alignment: MemoryLayout<AudioBufferList>.alignment)
    defer { buf.deallocate() }
    guard AudioObjectGetPropertyData(id, &a, 0, nil, &size, buf) == noErr else { return 0 }
    let abl = UnsafeMutableAudioBufferListPointer(buf.assumingMemoryBound(to: AudioBufferList.self))
    return abl.reduce(0) { $0 + Int($1.mNumberChannels) }
}

func targetDevice() -> AudioDeviceID? {
    deviceIDs().first { inputChannels($0) > 0 && deviceName($0).lowercased().contains(wanted) }
}

func defaultInput() -> AudioDeviceID {
    var a = addr(kAudioHardwarePropertyDefaultInputDevice)
    var id = AudioDeviceID(0)
    var size = UInt32(MemoryLayout<AudioDeviceID>.size)
    AudioObjectGetPropertyData(sys, &a, 0, nil, &size, &id)
    return id
}

func setDefaultInput(_ id: AudioDeviceID) {
    var a = addr(kAudioHardwarePropertyDefaultInputDevice)
    var dev = id
    let status = AudioObjectSetPropertyData(sys, &a, 0, nil, UInt32(MemoryLayout<AudioDeviceID>.size), &dev)
    if status != noErr { log("failed to set default input (status \(status))") }
}

func enforce() {
    guard let target = targetDevice() else { return }   // not connected → leave macOS's choice
    if defaultInput() != target {
        setDefaultInput(target)
        log("input -> \(deviceName(target))")
    }
}

let queue = DispatchQueue(label: "force-input-device")
let listener: AudioObjectPropertyListenerBlock = { _, _ in enforce() }

var defAddr = addr(kAudioHardwarePropertyDefaultInputDevice)
var devAddr = addr(kAudioHardwarePropertyDevices)
AudioObjectAddPropertyListenerBlock(sys, &defAddr, queue, listener)
AudioObjectAddPropertyListenerBlock(sys, &devAddr, queue, listener)

log("watching for input matching \"\(wanted)\"")
enforce()
CFRunLoopRun()
