-- Pull in the wezterm API
local wezterm = require("wezterm")
local theme = require("theme")
local fonts = require("fonts")
local keys = require("keys")
local bar = require("plugins.bar")
local move = require("plugins.move")
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
config.term = "wezterm"
config.default_workspace = "~"
config.warn_about_missing_glyphs = true
config.enable_scroll_bar = false
config.window_padding = {
	left = "0.5cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}
config.scrollback_lines = 3500
config.window_decorations = "RESIZE"

config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

config.window_background_opacity = 0.80
config.text_background_opacity = 0.40
config.macos_window_background_blur = 50
config.animation_fps = 60
config.prefer_egl = true

config.initial_rows = 40
config.initial_cols = 150

config.command_palette_rows = 14

config.show_update_window = false
config.check_for_updates = false

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800

-- and finally, return the configuration to wezter
fonts.setup(config)
theme.setup(config)
keys.setup(config)
bar.setup(config)
move.setup(config)
workspaceswitcher.setup(config)
return config
