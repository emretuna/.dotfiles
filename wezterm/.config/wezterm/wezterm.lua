-- Pull in the wezterm API
local wezterm = require("wezterm")
local tab = require("tab")
local fonts = require("fonts")
local keys = require("keys")
local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
local colors = theme.colors()
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
config.colors = colors
config.window_frame = theme.window_frame()
config.term = "wezterm"
config.warn_about_missing_glyphs = true
config.enable_scroll_bar = false
config.window_padding = {
	left = "0.5cell",
	right = "0cell",
	top = "1.50cell",
	bottom = "0cell",
}
config.scrollback_lines = 10000
config.window_decorations = "INTEGRATED_BUTTONS"

config.window_background_opacity = 0.6
config.text_background_opacity = 0.4
config.macos_window_background_blur = 50
config.animation_fps = 60
-- config.prefer_egl = true

config.initial_rows = 40
config.initial_cols = 150

config.command_palette_rows = 14
config.command_palette_bg_color = colors.background
config.command_palette_fg_color = colors.foreground
config.show_update_window = false
config.check_for_updates = false

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800

-- and finally, return the configuration to wezter
tab.setup(config)
fonts.setup(config)
keys.setup(config)
return config
