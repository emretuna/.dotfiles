local colors = require("../themes/kanagawa")

local lazygit_config = function(window, pane)
	local colorscheme = {
		lightTheme = false,
		activeBorderColor = { colors.green, "bold" },
		inactiveBorderColor = { colors.text },
		optionsTextColor = { colors.blue },
		selectedLineBgColor = { colors.surface0 },
		selectedRangeBgColor = { colors.surface0 },
		cherryPickedCommitBgColor = { colors.teal },
		cherryPickedCommitFgColor = { colors.blue },
		unstagedChangesColor = { colors.red },
	}

	return {
		args = { "lazygit" },
		cwd = pane:get_current_working_dir(),
		dimensions = { relative = "editor", width = 0.8, height = 0.8 },
		term = "xterm-256color",
		title = "LazyGit",
		set_environment_variables = {
			COLORTERM = "truecolor",
		},
		set_colors = colorscheme,
	}
end

return lazygit_config
