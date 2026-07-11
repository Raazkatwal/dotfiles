return {
	autostart = false,
	filetypes = { "php", "blade" },
	settings = {
		intelephense = {
			diagnostics = {
				enable = false,
			},
			files = {
				maxSize = 5000000,
				exclude = {
					"**/vendor/**",
					"**/node_modules/**",
					"**/.git/**",
					"**/storage/**",
					"**/bootstrap/cache/**",
				},
			},
			environment = {
				includePaths = { "vendor/laravel/framework/src" },
			},
		},
	},
}
