local wezterm = require("wezterm")
return {
	font = wezterm.font("FiraCode Nerd Font"),
	-- font = wezterm.font("CaskaydiaCove Nerd Font"),
	font_size = 10.0,

	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 5,
		bottom = 0,
	},

	default_prog = { "/usr/bin/bash"},
	-- window_background_opacity = 0.7,

	-- Start in fullscreen mode
	-- default_gui_startup_args = { "start", "--fullscreen" },
	-- background = {
	-- 	{
	-- 		source = {
	-- 			 File = ".wezterm_bg.jpg",
	-- 		},
	-- 		width = "100%",
	-- 		height = "100%",
	-- 		repeat_x = "NoRepeat",
	-- 		repeat_y = "NoRepeat",
	-- 		hsb = {
	-- 			brightness = 0.02,
	-- 			hue = 1.0,
	-- 			saturation = 1.0,
	-- 		},
	-- 		-- opacity = 0.3,
	-- 	},
	-- },
	--
	-- color_scheme = "Dracula (Official)",
	color_scheme = "tokyonight_night",
	colors = {
		ansi = {
			"#15161e",
			"#ff5c57",
			"#9ece6a",
			"#e0af68",
			"#4960d1",
			"#bb9af7",
			"#7dcfff",
			"#a9b1d6",
		},
		brights = {
			"#414868",
			"#f7768e",
			"#9ece6a",
			"#e0af68",
			"#6b83f9",
			"#bb9af7",
			"#7dcfff",
			"#c0caf5",
		},
	},
}
