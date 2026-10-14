local vue_language_server_path = vim.fn.stdpath("data")
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

return {
  autostart = false,
  filetypes = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
    "vue",
  },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
        configNamespace = "typescript",
      },
    },
  },
  settings = {
    typescript = {
      preferences = {
        autoImportFileExcludePatterns = { "**/.nuxt/**" },
      },
    },
    javascript = {
      preferences = {
        autoImportFileExcludePatterns = { "**/.nuxt/**" },
      },
    },
  },
  -- root_dir = function(fname)
  --   local util = require("lspconfig.util")
  --   return util.root_pattern("package.json", "jsconfig.json", "tsconfig.json", "vite.config.js", "vite.config.ts")(fname)
  --     or vim.fn.getcwd()
  -- end,
}
