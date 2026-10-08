// Disables AeroSpace when no external display is connected and re-enables it
// when one comes back. Event-driven via Core Graphics display reconfiguration
// callbacks — no polling.
//
// Usage: aerospace-display-toggle ["<path to aerospace CLI>"]
//   (default: /opt/homebrew/bin/aerospace)

import CoreGraphics
import Foundation

let aerospace = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "/opt/homebrew/bin/aerospace"

let logPath = NSHomeDirectory() + "/Library/Logs/aerospace-display-toggle.log"
func log(_ msg: String) {
    let line = "\(ISO8601DateFormatter().string(from: Date())) \(msg)\n"
    if let fh = FileHandle(forWritingAtPath: logPath) {
        fh.seekToEndOfFile(); fh.write(line.data(using: .utf8)!); fh.closeFile()
    } else {
        try? line.data(using: .utf8)!.write(to: URL(fileURLWithPath: logPath))
    }
    FileHandle.standardError.write(line.data(using: .utf8)!)
}

func externalCount() -> Int {
    var count = UInt32(0)
    guard CGGetActiveDisplayList(0, nil, &count) == .success else { return 0 }
    var ids = [CGDirectDisplayID](repeating: 0, count: Int(count))
    guard CGGetActiveDisplayList(count, &ids, &count) == .success else { return 0 }
    return ids.prefix(Int(count)).filter { CGDisplayIsBuiltin($0) == 0 }.count
}

func runAerospace(_ state: String) -> Bool {
    let p = Process()
    p.executableURL = URL(fileURLWithPath: aerospace)
    p.arguments = ["enable", state]
    p.standardOutput = FileHandle.nullDevice
    p.standardError = FileHandle.nullDevice
    do { try p.run() } catch { return false }
    p.waitUntilExit()
    return p.terminationStatus == 0
}

let queue = DispatchQueue(label: "aerospace-display-toggle")
var applied: String?
var pending: DispatchWorkItem?

// AeroSpace may not be up yet at login, so retry for a while before giving up.
func apply(attempt: Int = 0) {
    let state = externalCount() > 0 ? "on" : "off"
    if state == applied { return }
    if runAerospace(state) {
        applied = state
        log("externals: \(externalCount()) -> aerospace enable \(state)")
    } else if attempt < 24 {
        queue.asyncAfter(deadline: .now() + 5) { apply(attempt: attempt + 1) }
    } else {
        log("aerospace enable \(state) failed")
    }
}

// Reconfiguration fires several callbacks per change; debounce until it settles.
func schedule() {
    pending?.cancel()
    let work = DispatchWorkItem { apply() }
    pending = work
    queue.asyncAfter(deadline: .now() + 1, execute: work)
}

CGDisplayRegisterReconfigurationCallback({ _, flags, _ in
    if flags.contains(.beginConfigurationFlag) { return }
    queue.async { schedule() }
}, nil)

log("watching displays, aerospace at \(aerospace)")
queue.async { apply() }
CFRunLoopRun()
