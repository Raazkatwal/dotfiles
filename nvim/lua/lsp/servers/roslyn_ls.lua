return {
	autostart = false,
	cmd = {
		"roslyn-language-server",
		"--stdio",
	},

	filetypes = {
		"cs",
		"razor",
	},

	root_markers = {
		"*.sln",
		"*.slnx",
		"*.csproj",
		".git",
	},
}
