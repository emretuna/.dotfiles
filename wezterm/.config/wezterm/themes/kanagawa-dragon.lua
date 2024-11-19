return {
	foreground = "#c5c9c5",
	background = "#181616",

	cursor_bg = "#C8C093",
	cursor_fg = "#C8C093",
	cursor_border = "#C8C093",

	selection_fg = "#C8C093",
	selection_bg = "#2D4F67",

	scrollbar_thumb = "#16161D",
	split = "#16161D",

	ansi = {
		"#0D0C0C",
		"#C4746E",
		"#8A9A7B",
		"#C4B28A",
		"#8BA4B0",
		"#A292A3",
		"#8EA4A2",
		"#C8C093",
	},
	brights = {
		"#A6A69C",
		"#E46876",
		"#87A987",
		"#E6C384",
		"#7FB4CA",
		"#938AA9",
		"#7AA89F",
		"#C5C9C5",
	},

	tab_bar = {
		background = "#181616", -- unified with general background
		active_tab = {
			bg_color = "#2D4F67", -- active tab stands out
			fg_color = "#C8C093", -- primary highlight color
		},
		inactive_tab = {
			bg_color = "#202020", -- softer contrast for inactive tabs
			fg_color = "#AFAFAF", -- light_gray
		},
		inactive_tab_hover = {
			bg_color = "#2D4F67", -- hover matches active for clarity
			fg_color = "#C8C093", -- primary highlight
		},
		new_tab = {
			bg_color = "#202020", -- consistent with inactive_tab
			fg_color = "#AFAFAF", -- light_gray
		},
		new_tab_hover = {
			bg_color = "#2D4F67", -- matches hover state
			fg_color = "#C8C093", -- primary highlight
		},
		inactive_tab_edge = "#181616", -- blends with background
	},
}
