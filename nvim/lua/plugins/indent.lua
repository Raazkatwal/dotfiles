return {
	"lukas-reineke/indent-blankline.nvim",
	enabled=false,
	main = "ibl", -- important for v3
	opts = {
		indent = {
			char = "│", -- vertical line
			tab_char = "│",
		},
		-- do NOT enable scope; this removes bold/underlines
		scope = {
			enabled = false, -- disables highlighting of current block
		},
		exclude = {
			filetypes = { "help", "terminal", "lazy", "dashboard" },
			buftypes = { "terminal" },
		},
	},
}
