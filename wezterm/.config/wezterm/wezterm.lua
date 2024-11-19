-- Pull in the wezterm API
local wezterm = require("wezterm")
local fonts = require("fonts")
local keys = require("keys")
local bar = require("plugins.bar")
local move = require("plugins.move")
local theme = require("themes.kanagawa-dragon")
local workspaceswitcher = require("plugins.workspace-switcher")
local config = {}

config.unix_domains = {
	{
		name = "unix",
		proxy_command = { "nc", "-U", "/Users/emretuna/.local/share/wezterm/sock" },
	},
}

-- This causes `wezterm` to act as though it was started as
-- `wezterm connect unix` by default, connecting to the unix
-- domain on startup.
-- If you prefer to connect manually, leave out this line.
-- config.default_gui_startup_args = { "connect", "unix" }

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
config.colors = theme
-- config.term = "wezterm"
config.default_workspace = "~"
config.warn_about_missing_glyphs = true
config.enable_scroll_bar = false
config.window_padding = {
	left = "0.50cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}
config.scrollback_lines = 3500
config.window_decorations = "RESIZE"
config.use_resize_increments = false

config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

config.window_background_opacity = 0.75
-- config.text_background_opacity = 0.60
config.macos_window_background_blur = 50
config.animation_fps = 60
config.prefer_egl = true

config.initial_rows = 40
config.initial_cols = 150

config.command_palette_rows = 14
config.command_palette_bg_color = theme.selection_bg
config.command_palette_fg_color = theme.selection_fg
config.show_update_window = false
config.check_for_updates = false

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800

-- Enable the kitty graphics module
config.enable_kitty_graphics = true

-- and finally, return the configuration to wezter
fonts.setup(config)
keys.setup(config)
bar.setup(config)
move.setup(config)
workspaceswitcher.setup(config)
return config
