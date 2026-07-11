return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"muniftanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		vim.keymap.set("n", "<leader>fe", ":Neotree toggle<cr>", { noremap = true, silent = true })

		local devicons = require("nvim-web-devicons")

		devicons.set_icon({
			["blade.php"] = {
				icon = "󰫐",
				color = "#f55247",
				name = "Blade",
			},
		})

		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
			},
			window = {
				position = "right",
				width = 30,
			},
			default_component_configs = {
				indent = {
					with_expanders = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>be", ":Neotree buffers toggle right<CR>", {
			noremap = true,
			silent = true,
			desc = "NeoTree Buffers",
		})
	end,
}
