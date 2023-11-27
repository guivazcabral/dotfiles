local wezterm = require("wezterm")
local config = {}

config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 1
config.automatically_reload_config = true
config.native_macos_fullscreen_mode = true
config.window_decorations = "RESIZE"

wezterm.font("CommitMono", { weight = "Regular", stretch = "Normal", style = "Normal" }) -- /Users/guilherme/Library/Fonts/CommitMono-400-Regular.otf, CoreText
wezterm.font("CommitMono", { weight = "Regular", stretch = "Normal", style = "Italic" }) -- /Users/guilherme/Library/Fonts/CommitMono-400-Italic.otf, CoreText
wezterm.font("CommitMono", { weight = "Bold", stretch = "Normal", style = "Normal" }) -- /Users/guilherme/Library/Fonts/CommitMono-700-Regular.otf, CoreText
wezterm.font("CommitMono", { weight = "Bold", stretch = "Normal", style = "Italic" }) -- /Users/guilherme/Library/Fonts/CommitMono-700-Italic.otf, CoreText
config.font_size = 12.5

config.default_prog = {
  "/opt/homebrew/bin/fish",
  "-l",
  "-c",
  "zellij",
}

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

wezterm.on("gui-attached", function(domain)
  -- maximize all displayed windows on startup
  for _, window in ipairs(mux.all_windows()) do
    window:gui_window():maximize()
  end
end)

return config
