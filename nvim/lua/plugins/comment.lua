return {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "blade",
			callback = function()
				vim.bo.commentstring = "{{-- %s --}}"
			end,
		})

		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
