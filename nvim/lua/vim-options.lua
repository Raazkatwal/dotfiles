----------------------------------------------------------------------
-- Basic Editor Settings
----------------------------------------------------------------------
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
-- vim.opt.mouse = ""
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.showmode = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.linebreak = true
vim.opt.showmatch = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"

vim.g.mapleader = " "

----------------------------------------------------------------------
-- Automatically Remove Trailing Whitespace on Save
----------------------------------------------------------------------
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	command = "%s/\\s\\+$//e",
-- })

----------------------------------------------------------------------
-- Use Ctrl + l to delete a character on the right side
----------------------------------------------------------------------
vim.keymap.set("i", "<C-l>", "<Del>")

----------------------------------------------------------------------
-- Window Navigation Keymaps
----------------------------------------------------------------------
-- Move between windows using Ctrl + h/j/k/l
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

----------------------------------------------------------------------
-- Disable Arrow Keys
----------------------------------------------------------------------
-- vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
-- vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")
-- vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
-- vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")

----------------------------------------------------------------------
-- Force InsertLeave to fire on ctrl + C
----------------------------------------------------------------------
vim.keymap.set("i", "<C-c>", function()
	vim.cmd("stopinsert") -- forces InsertLeave
end, { noremap = true, silent = true })

----------------------------------------------------------------------
-- Scrolling Improvements
----------------------------------------------------------------------
-- Half-page scroll and re-center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz", { remap = true, desc = "Half-page down + center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { remap = true, desc = "Half-page up + center" })

----------------------------------------------------------------------
-- Move Lines Up/Down
----------------------------------------------------------------------
-- Normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Visual mode (keeps selection)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

----------------------------------------------------------------------
-- Center Screen After Searching
----------------------------------------------------------------------
vim.keymap.set("n", "n", "nzz", { remap = true })
vim.keymap.set("n", "N", "Nzz", { remap = true })

----------------------------------------------------------------------
-- Copy File Paths to Clipboard
----------------------------------------------------------------------
-- Copy absolute path
vim.keymap.set("n", "<leader>yp", function()
	local abs_path = vim.fn.expand("%:p")
	vim.fn.setreg("+", abs_path)
	print("Copied absolute path: " .. abs_path)
end, { desc = "Copy absolute file path" })

-- Copy relative path
vim.keymap.set("n", "<leader>yr", function()
	local rel_path = vim.fn.expand("%")
	vim.fn.setreg("+", rel_path)
	print("Copied relative path: " .. rel_path)
end, { desc = "Copy relative file path" })

vim.keymap.set("n", "<leader>yf", function()
	local path = vim.fn.expand("%:p")
	local uri = "file://" .. path

	vim.fn.system({
		"wl-copy",
		"--type",
		"text/uri-list",
	}, uri .. "\n")

	print("Copied file reference")
end)

----------------------------------------------------------------------
-- Highlight on Yank
----------------------------------------------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 500 })
	end,
})

vim.keymap.set("n", "<leader>h", ":noh<CR>", { desc = "Clear search highlighting" })

----------------------------------------------------------------------
-- Lsp Picker keymaps
----------------------------------------------------------------------
vim.keymap.set("n", "<leader>ls", function()
	require("lsp.telescope-picker").start()
end, { desc = "Start Lsp (picker)" })

vim.keymap.set("n", "<leader>lS", function()
	require("lsp.telescope-picker").stop()
end, { desc = "Stop Lsp (picker)" })

vim.keymap.set("n", "<leader>li", ":LspInfo<CR>", { desc = "LSP Info" })

----------------------------------------------------------------------
-- Diagnostics
----------------------------------------------------------------------
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})

----------------------------------------------------------------------
----- Blade and php toggle
-------------------------------------------------------------------------
vim.keymap.set("n", "<leader>fp", function()
	if vim.bo.filetype == "php" then
		vim.cmd("set filetype=blade")
		print("Filetype set to Blade")
	else
		vim.cmd("set filetype=php")
		print("Filetype set to PHP")
	end
end, { desc = "Toggle between PHP and Blade filetypes" })

----------------------------------------------------------------------
----- Undo Tree
-------------------------------------------------------------------------
-- vim.cmd("packadd nvim.undotree")
-- vim.keymap.set("n", "<leader>u", require("undotree").open)
