local wezterm = require("wezterm")
local rosepine = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
local colors = rosepine.colors()

local M = {}

function M.setup(config)
	config.colors = colors
	config.window_frame = rosepine.window_frame()
	config.command_palette_bg_color = colors.background
	config.command_palette_fg_color = colors.foreground
end
return M
