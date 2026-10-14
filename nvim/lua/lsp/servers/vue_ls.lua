return {
	autostart = false,

	filetypes = { "vue" },

	-- The Vue language server only manages the CSS/HTML sections ("hybrid mode").
	-- TypeScript support inside .vue files comes from ts_ls with the
	-- @vue/typescript-plugin (see lsp/servers/ts_ls.lua).
	-- on_init / cmd / root_markers are provided by nvim-lspconfig defaults.
}
