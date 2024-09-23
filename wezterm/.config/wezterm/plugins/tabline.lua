local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local M = {}

function M.setup()
	tabline.setup({
		options = {
			color_overrides = {
				tab = {
					active = { fg = "#e0def4", bg = "#26233a" },
					inactive = { fg = "#6e6a86", bg = "#191724" },
					inactive_hover = { fg = "#e0def4", bg = "#26233a" },
				},
			},
			section_separators = "",
			component_separators = "",
			tab_separators = "",
		},
	})
end
return M
