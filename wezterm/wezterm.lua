local wezterm = require("wezterm")
return {
	font = wezterm.font("FiraCode Nerd Font"),
	-- font = wezterm.font("CaskaydiaCove Nerd Font"),
	font_size = 10.0,

	-- window_decorations = "NONE",
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	default_prog = { os.getenv("SHELL") or "zsh" },
	-- window_background_opacity = 0.7,

	-- Start in fullscreen mode
	-- default_gui_startup_args = { "start", "--fullscreen" },
	background = {
		{
			source = {
				 File = ".wezterm_bg.jpg",
			},
			width = "100%",
			height = "100%",
			repeat_x = "NoRepeat",
			repeat_y = "NoRepeat",
			hsb = {
				brightness = 0.02,
				hue = 1.0,
				saturation = 1.0,
			},
			-- opacity = 0.3,
		},
	},
}
