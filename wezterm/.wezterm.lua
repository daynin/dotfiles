local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Config
config.warn_about_missing_glyphs = false
config.color_scheme = 'Everforest Dark (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#282C34',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#282C34',
}

config.window_padding = {
  left = 10,
  right = 10,
  top = 0,
  bottom = 0,
}

config.window_decorations = 'RESIZE'
config.term = 'wezterm'
config.font = wezterm.font 'Maple Mono'

return config

