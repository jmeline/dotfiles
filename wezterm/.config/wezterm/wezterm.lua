local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.audible_bell = "Disabled"
-- config.color_scheme = 'Dracula (Official)'
config.color_scheme = 'Dracula Pro Buffy'
config.font = wezterm.font("Comic Code Ligatures", {
  weight = "Regular",
  italic = false
})

config.font_size = 13.0

return config
