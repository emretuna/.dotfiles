local kanagawa = {
	foreground = "#dcd7ba",
	background = "#1F1F28",

	cursor_bg = "#c8c093",
	cursor_fg = "#c8c093",
	cursor_border = "#c8c093",

	selection_fg = "#c8c093",
	selection_bg = "#2d4f67",

	scrollbar_thumb = "#16161d",
	split = "#16161d",
	--ansi colors with color name and values
	ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
	brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
	indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
	tab_bar = {
		background = "#1f1f28",
		active_tab = {
			bg_color = "none",
			fg_color = "#7e9cd8",
			intensity = "Bold",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#1f1f28",
			fg_color = "#727169",
		},
		inactive_tab_hover = {
			bg_color = "#1f1f28",
			fg_color = "#dcd7ba",
		},
		new_tab = {
			bg_color = "#1f1f28",
			fg_color = "#dcd7ba",
		},
		new_tab_hover = {
			bg_color = "#7e9cd8",
			fg_color = "#e6c384",
		},
	},
}
return kanagawa
