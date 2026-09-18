return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						"vendor/.*",
						"node_modules/.*",
						".git/.*",
						".agents/.*",
						".codex/.*",
						".claude/.*",
						".idea/.*",
						".vscode/.*",
						"bootstrap/cache/.*",
						"public/build/.*",
						"public/storage/.*",
						"public/js/.*",
						"public/css/.*",
						"public/mix-manifest.json",
						"storage/.*",
						"*.lock",
					},
				},

				pickers = {
					find_files = {
						hidden = true,
					},
				},
			})
		end,

		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find Files",
			},

			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live Grep",
			},

			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Find Buffers",
			},

			{
				"<leader><leader>",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Old Files",
			},

			{
				"gd",
				function()
					require("telescope.builtin").lsp_definitions({
						entry_filter = function(entry)
							local filename =
								entry.filename
								or entry.value.filename
								or entry.value.uri
								or ""

							return not (
								filename:match("_ide_helper")
								or filename:match("ide_helper_models")
							)
						end,
					})
				end,
				desc = "Telescope: Definitions",
			},

			{
				"<leader>gd",
				function()
					require("telescope.builtin").lsp_definitions({
						entry_filter = function(entry)
							local filename =
								entry.filename
								or entry.value.filename
								or entry.value.uri
								or ""

							return not (
								filename:match("_ide_helper")
								or filename:match("ide_helper_models")
							)
						end,
					})
				end,
				desc = "Telescope: Definitions",
			},

			{
				"gi",
				function()
					require("telescope.builtin").lsp_implementations()
				end,
				desc = "Telescope: Implementations",
			},

			{
				"<leader>gi",
				function()
					require("telescope.builtin").lsp_implementations()
				end,
				desc = "Telescope: Implementations",
			},

			{
				"gD",
				function()
					require("telescope.builtin").lsp_type_definitions()
				end,
				desc = "Telescope: Type Definitions",
			},

			{
				"<leader>gD",
				function()
					require("telescope.builtin").lsp_type_definitions()
				end,
				desc = "Telescope: Type Definitions",
			},

			{
				"gr",
				function()
					require("telescope.builtin").lsp_references({
						entry_filter = function(entry)
							local filename =
								entry.filename
								or entry.value.filename
								or entry.value.uri
								or ""

							return not (
								filename:match("_ide_helper")
								or filename:match("ide_helper_models")
							)
						end,
					})
				end,
				desc = "Telescope: References",
			},

			{
				"<leader>gr",
				function()
					require("telescope.builtin").lsp_references({
						entry_filter = function(entry)
							local filename =
								entry.filename
								or entry.value.filename
								or entry.value.uri
								or ""

							return not (
								filename:match("_ide_helper")
								or filename:match("ide_helper_models")
							)
						end,
					})
				end,
				desc = "Telescope: References",
			},

			{
				"<leader>fd",
				function()
					require("telescope.builtin").diagnostics({
						bufnr = 0,
					})
				end,
				desc = "Telescope: Diagnostics (current file)",
			},

			{
				"<leader>wd",
				function()
					require("telescope.builtin").diagnostics({
						filter = function(diagnostic)
							local filename =
								vim.api.nvim_buf_get_name(diagnostic.bufnr)

							return not filename:match("_ide_helper")
						end,
					})
				end,
				desc = "Telescope: Diagnostics (workspace)",
			},

			{
				"<leader>bn",
				"<cmd>bnext<CR>",
				desc = "Next buffer",
			},

			{
				"<leader>bp",
				"<cmd>bprevious<CR>",
				desc = "Previous buffer",
			},

			{
				"gl",
				vim.diagnostic.open_float,
				desc = "Line Diagnostics",
			},

			{
				"<leader>gl",
				vim.diagnostic.open_float,
				desc = "Line Diagnostics",
			},
		},
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = true,
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
}
