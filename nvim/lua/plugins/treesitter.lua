return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	dependencies = {
		"neovim-treesitter/treesitter-parser-registry",
	},
	lazy = false,
	build = ":TSUpdate",

	config = function()
		vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/runtime")

		require("nvim-treesitter").install({
			"lua",
			"html",
			"css",
			"javascript",
			"typescript",
			"php",
			"vue",
			"json",
			"bash",
			"markdown",
			"blade",
			"razor",
			"python",
			"ruby",
			"go",
			"rust",
			"c",
			"cpp",
			"java",
			"c_sharp",
			"sql",
			"yaml",
			"toml",
			"xml",
			"dockerfile",
			"gitcommit",
			"diff",
			"cmake",
			"make",
		})

		vim.filetype.add({
			filename = {
				[".env"] = "bash",
			},
			pattern = {
				[".*%.blade%.php"] = "blade",
				[".*%.cshtml"] = "razor",
				["%.env.*"] = "bash",
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"lua",
				"html",
				"css",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"php",
				"vue",
				"json",
				"bash",
				"markdown",
				"blade",
				"razor",
				"python",
				"ruby",
				"go",
				"rust",
				"c",
				"cpp",
				"java",
				"cs",
				"sql",
				"yaml",
				"toml",
				"xml",
				"dockerfile",
				"gitcommit",
				"cmake",
				"make",
			},
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
