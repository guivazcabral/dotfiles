local wezterm = require("wezterm")
local act = wezterm.action

return {
  {
    key = "v",
    mods = "CMD",
    action = act.PasteFrom("Clipboard"),
  },
  {
    key = "k",
    mods = "CMD",
    action = act.Multiple({
      act.ClearScrollback("ScrollbackOnly"),
      act.SendKey({ key = "L", mods = "CTRL" }),
    }),
  },
  {
    key = "q",
    mods = "CMD",
    action = act.QuitApplication,
  },
  {
    key = "h",
    mods = "CMD",
    action = wezterm.action.HideApplication,
  },
  {
    key = "=",
    mods = "CMD",
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = "-",
    mods = "CMD",
    action = wezterm.action.DecreaseFontSize,
  },
}
