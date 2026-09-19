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
-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	lazy = false,
-- 	build = ":TSUpdate",
--
-- 	config = function()
-- 		-- Install the parsers you actually use.
-- 		require("nvim-treesitter").install({
-- 			"lua",
-- 			"html",
-- 			"css",
-- 			"javascript",
-- 			"typescript",
-- 			"php",
-- 			"vue",
-- 			"json",
-- 			"bash",
-- 			"markdown",
-- 		})
--
-- 		-- Enable Tree-sitter features.
-- 		vim.api.nvim_create_autocmd("FileType", {
-- 			pattern = {
-- 				"lua",
-- 				"html",
-- 				"css",
-- 				"javascript",
-- 				"typescript",
-- 				"php",
-- 				"vue",
-- 				"json",
-- 				"bash",
-- 				"markdown",
-- 				"blade",
-- 			},
--
-- 			callback = function()
-- 				-- Tree-sitter highlighting
-- 				vim.treesitter.start()
--
-- 				-- Tree-sitter indentation
-- 				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 			end,
-- 		})
--
-- 		-- Tell Neovim: *.blade.php = blade
-- 		vim.filetype.add({
-- 			pattern = {
-- 				[".*%.blade%.php"] = "blade",
-- 				[".*%.cshtml"] = "razor",
-- 			},
-- 		})
-- 	end,
-- }
