-- Pull in the wezterm API
local wezterm = require("wezterm")
local tab = require("tab")
local fonts = require("fonts")
local keys = require("keys")
local theme = require("themes/kanagawa")

local config = {}
-- Pywal config
-- wezterm.add_to_config_reload_watch_list("home/emretuna/.wezterm.lua")
-- wezterm.add_to_config_reload_watch_list("home/emretuna/.cache/wal/wezterm-wal.toml")
-- config.color_scheme_dirs = { "/home/emretuna/.cache/wal" }
-- config.color_scheme = "Pywal"

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end
-- This module should set the appearance-related options.
-- Configurations
--
-- Set the Kanagawa theme as the default
config.colors = theme
config.term = "wezterm"
config.warn_about_missing_glyphs = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.scrollback_lines = 10000
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.8
config.text_background_opacity = 0.6
config.macos_window_background_blur = 50
config.animation_fps = 60

config.initial_rows = 40
config.initial_cols = 150

config.show_update_window = false
config.check_for_updates = false

config.hyperlink_rules = wezterm.default_hyperlink_rules()
-- and finally, return the configuration to wezter
tab.setup(config)
fonts.setup(config)
keys.setup(config)

return config
