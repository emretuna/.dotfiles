local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local M = {}

function M.setup()
	tabline.setup({
		options = {
			section_separators = "",
			component_separators = "",
			tab_separators = "",
			extensions = { "resurrect", "smart_workspace_switcher" },
		},
	})
end
return M
