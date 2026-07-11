return {
	"ricardoramirezr/blade-nav.nvim",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	ft = { "blade", "php" },
	opts = {
		close_tag_on_complete = true,
	},
	config = function(_, opts)
		local blade = require("blade-nav")
		blade.setup(opts)

		-- Patch blade-nav internal gf
		local gf_module = require("blade-nav.gf")

		local original_gf = gf_module.gf

		gf_module.gf = function(...)
			local ok = pcall(original_gf, ...)
			if not ok then
				-- silently ignore errors
				return
			end
		end
	end,
}
