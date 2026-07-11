return {
	-- mason.nvim
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- mason-lspconfig.nvim
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_install = false,
				automatic_enable = false,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
	},
}
