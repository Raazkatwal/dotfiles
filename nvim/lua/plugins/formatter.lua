return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			json = { "prettierd" },
			vue = { "prettierd" },
			-- php = { "blade-formatter", "pint" },
			php = { "pint" },
			blade = { "blade-formatter"},
			c = { "clang-format" },
			cpp = { "clang-format" },
			python = { "black" },
			htmldjango = { "djlint" },
			rust = { "rustfmt" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		vim.keymap.set("n", "<leader>gf", function()
			require("conform").format({ async = true, lsp_fallback = true, timeout_ms = 5000 })
		end, { desc = "Format file" })
	end,
}
