return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin")

	-- 	vim.cmd([[
	-- 		highlight Normal guibg=none
	-- 		highlight Nontext guibg=none
	-- 		highlight NormalNC guibg=none
	-- 		highlight SignColumn guibg=none
	-- 		highlight VertSplit guibg=none
	-- 		highlight EndOfBuffer guibg=none
	-- ]])
	end,
}
