return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- Treesitter setup
		local config = require("nvim-treesitter.configs")
		config.setup({
			-- ensure_installed = { "lua", "html", "css", "javascript", "php", "blade", "vue" },  -- left commented as you had it
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "blade", "php" },
			},
			playground = { enable = true },
			indent = { enable = true },
		})

		-- Tell Neovim: *.blade.php = blade
		vim.filetype.add({
			pattern = {
				[".*%.blade%.php"] = "blade",
			},
		})
	end,
}
