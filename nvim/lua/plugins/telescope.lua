return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						"vendor/.*",
						-- "_ide_helper.*",
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
						hidden = true, -- show hidden files
						-- no_ignore = false (default), so .gitignore is respected
					},
				},
			})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
			vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

			-- Definitions
			local function ignore_ide_helper(entry)
				local filename = entry.filename or entry.value.filename or entry.value.uri or ""

				return not (filename:match("_ide_helper") or filename:match("ide_helper_models"))
			end

			vim.keymap.set("n", "gd", function()
				builtin.lsp_definitions({
					entry_filter = ignore_ide_helper,
				})
			end, { desc = "Telescope: Definitions" })

			vim.keymap.set("n", "<leader>gd", function()
				builtin.lsp_definitions({
					entry_filter = ignore_ide_helper,
				})
			end, { desc = "Telescope: Definitions" })

			-- Implementations
			vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Telescope: Implementations" })
			vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Telescope: Implementations" })

			-- Type Definitions
			vim.keymap.set("n", "gD", builtin.lsp_type_definitions, { desc = "Telescope: Type Definitions" })
			vim.keymap.set("n", "<leader>gD", builtin.lsp_type_definitions, { desc = "Telescope: Type Definitions" })

			-- Line diagnostics
			vim.keymap.set("n", "gl", vim.diagnostic.open_float)
			vim.keymap.set("n", "<leader>gl", vim.diagnostic.open_float)

			-- References
			vim.keymap.set("n", "gr", function()
				builtin.lsp_references({
					entry_filter = ignore_ide_helper,
				})
			end, { desc = "Telescope: References" })
			vim.keymap.set("n", "<leader>gr", function()
				builtin.lsp_references({
					entry_filter = ignore_ide_helper,
				})
			end, { desc = "Telescope: References" })
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Old Files" })
			vim.keymap.set("n", "<leader>fd", function()
				builtin.diagnostics({ bufnr = 0 })
			end, { desc = "Telescope: Diagnostics (current file)" })
			vim.keymap.set("n", "<leader>wd", function()
				builtin.diagnostics({
					filter = function(diagnostic)
						local filename = vim.api.nvim_buf_get_name(diagnostic.bufnr)
						return not filename:match("_ide_helper")
					end,
				})
			end, { desc = "Telescope: Diagnostics (workspace)" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
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
