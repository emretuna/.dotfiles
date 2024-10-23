local wezterm = require("wezterm")
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
local M = {}

function M.setup(config)
	-- example enable spotify module
	local bar_config = {
		position = "top",
		modules = {
			spotify = {
				enabled = false,
			},
		},
	}
	bar.apply_to_config(bar_config)
end
return M
