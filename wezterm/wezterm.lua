local wezterm = require("wezterm")
local mux = wezterm.mux
local keys = require("config.keys")

wezterm.on("gui-startup", function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

wezterm.on("gui-attached", function()
  -- maximize all displayed windows on startup
  for _, window in ipairs(mux.all_windows()) do
    window:gui_window():maximize()
  end
end)

local config = {
  adjust_window_size_when_changing_font_size = false,
  automatically_reload_config = true,
  color_scheme = "Catppuccin Mocha",
  disable_default_key_bindings = true,
  font = wezterm.font("FiraCode Nerd Font"),
  line_height = 1.1,
  font_size = 13,
  hide_tab_bar_if_only_one_tab = true,
  keys = keys,
  native_macos_fullscreen_mode = true,
  window_background_opacity = 1,
  window_decorations = "RESIZE",

  default_prog = {
    "/opt/homebrew/bin/fish",
    "-l",
    "-c",
    "zellij",
  },
}

return config
