return {
	foreground = "#B4BDC3",
	background = "#1C1917",
	cursor_fg = "#1C1917",
	cursor_bg = "#C4CACF",
	cursor_border = "#1C1917",
	selection_fg = "#B4BDC3",
	selection_bg = "#3D4042",

	ansi = { "#1C1917", "#DE6E7C", "#819B69", "#B77E64", "#6099C0", "#B279A7", "#66A5AD", "#B4BDC3" },
	brights = { "#403833", "#E8838F", "#8BAE68", "#D68C67", "#61ABDA", "#CF86C1", "#65B8C1", "#888F94" },

	tab_bar = {
		background = "#1C1917", -- main_palette.base (background color)
		active_tab = {
			bg_color = "#1C1917", -- color0
			fg_color = "#B4BDC3", -- foreground
		},
		inactive_tab = {
			bg_color = "#403833", -- color8
			fg_color = "#888F94", -- color7
		},
		inactive_tab_hover = {
			bg_color = "#1C1917", -- color0 (same as active_tab)
			fg_color = "#B4BDC3", -- foreground
		},
		new_tab = {
			bg_color = "#403833", -- color8 (same as inactive_tab)
			fg_color = "#888F94", -- color7
		},
		new_tab_hover = {
			bg_color = "#1C1917", -- color0 (same as active_tab)
			fg_color = "#B4BDC3", -- foreground
		},
		inactive_tab_edge = "#3D4042", -- selection background
	},
}
