return {
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "blade",
				callback = function()
					vim.bo.commentstring = "{{-- %s --}}"
				end,
			})

			require("Comment").setup()
		end,
	},
}
