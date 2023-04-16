local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Config
config.color_scheme = 'OneDark (base16)'
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#282C34',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#282C34',
}
config.term = 'wezterm'

return config

