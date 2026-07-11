return {
  autostart = false,
  filetypes = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
    "vue",
  },
  -- root_dir = function(fname)
  --   local util = require("lspconfig.util")
  --   return util.root_pattern("package.json", "jsconfig.json", "tsconfig.json", "vite.config.js", "vite.config.ts")(fname)
  --     or vim.fn.getcwd()
  -- end,
}
