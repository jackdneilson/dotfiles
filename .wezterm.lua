local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = "carbonfox"
config.audible_bell = "Disabled"
config.default_domain = 'WSL:openSUSE-Tumbleweed'
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

return config
