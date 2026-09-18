return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",

	config = function()
		require("gitsigns").setup()

		vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", {
			desc = "Git: Preview Hunk",
		})

		vim.keymap.set("n", "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", {
			desc = "Git: Toggle Line Blame",
		})
	end,
}
