return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			filetypes = { "*", "css", "html" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = false,
				RRGGBBAA = true,
				rgb_fn = true,
				hsl_fn = true,
				tailwind = true,
				mode = "background",
				virtualtext = "■",
			},
		})
	end,
}
