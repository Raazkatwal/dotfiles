return {
	autostart = false,
	cmd = { "emmet-language-server", "--stdio" },
	filetypes = {
		"html",
		"xml",
		"php",
		"blade",
		"eruby",
		"css",
		"scss",
		"javascriptreact",
		"typescriptreact",
		"vue",
		"svelte",
	},
	init_options = {
		userLanguages = {
			php = "html",
			blade = "html",
		},
	},
}
