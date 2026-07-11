local Pickers = require("telescope.pickers")
local Finders = require("telescope.finders")
local Conf = require("telescope.config").values
local Actions = require("telescope.actions")
local ActionState = require("telescope.actions.state")
local Themes = require("telescope.themes")

-- Get only installed LSP servers from Mason (category "LSP")
local function get_installed_lsp_names()
  local registry = require("mason-registry")
  if not registry.is_installed then
    print("Mason registry not ready")
    return {}
  end

  local mason_lspconfig = require("mason-lspconfig")
  local mappings = mason_lspconfig.get_mappings().package_to_lspconfig

  local lsp_names = {}
  for _, pkg in ipairs(registry.get_installed_packages()) do
    if vim.tbl_contains(pkg.spec.categories or {}, "LSP") then
      local lsp_name = mappings[pkg.name] or pkg.name
      table.insert(lsp_names, lsp_name)
    end
  end

  table.sort(lsp_names)
  return lsp_names
end

-- Get set of currently running server names
local function get_running_clients()
  local running = {}
  for _, client in ipairs(vim.lsp.get_clients()) do
    running[client.name] = true
  end
  return running
end

-- LSP Start Picker (enable with custom config)
local function lsp_start_picker()
  local servers = get_installed_lsp_names()
  local running = get_running_clients()

  if #servers == 0 then
    print("No LSP servers installed via Mason")
    return
  end

  Pickers.new(Themes.get_dropdown({ previewer = false }), {
    prompt_title = "Start LSP Server",
    finder = Finders.new_table({
      results = servers,
      entry_maker = function(entry)
        local is_running = running[entry]
        local display = is_running and "● " .. entry .. " (running)" or "○ " .. entry
        return {
          value = entry,
          display = display,
          ordinal = entry,
        }
      end,
    }),
    sorter = Conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<C-j>", Actions.move_selection_next)
      map("i", "<C-k>", Actions.move_selection_previous)
      map("i", "<C-n>", Actions.move_selection_next)
      map("i", "<C-p>", Actions.move_selection_previous)

      Actions.select_default:replace(function()
        local selection = ActionState.get_selected_entry()
        if not selection then
          print("No server selected")
          Actions.close(prompt_bufnr)
          return
        end
        Actions.close(prompt_bufnr)

        local server = selection.value

        -- Lazy-load custom config if exists
        local config_path = "lsp.servers." .. server
        local ok, custom_config = pcall(require, config_path)
        if not ok then
          print("No custom config for " .. server .. " — using minimal defaults")
          custom_config = { autostart = false }
        end

        -- Shared capabilities and on_attach
        custom_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
        custom_config.capabilities.offsetEncoding = { "utf-8" }

        custom_config.on_attach = function(client, bufnr)
          local bufmap = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end
          bufmap("n", "K", vim.lsp.buf.hover, "LSP: Hover")
          bufmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: Code Action")
        end

        -- Register and enable with custom config
        vim.lsp.config(server, custom_config)
        vim.lsp.enable(server)

        print("Enabled custom LSP config: " .. server .. " (on-demand)")
      end)

      map("i", "<CR>", Actions.select_default)
      map("n", "<CR>", Actions.select_default)
      return true
    end,
  }):find()
end

-- LSP Stop Picker - fully future-proof (Neovim 0.13+ ready)
local function lsp_stop_picker()
  local clients = vim.lsp.get_clients()
  if #clients == 0 then
    print("No running LSP servers")
    return
  end

  Pickers.new(Themes.get_dropdown({}), {
    prompt_title = "Stop LSP Server",
    finder = Finders.new_table({
      results = clients,
      entry_maker = function(client)
        return {
          value = client,
          display = "● " .. client.name .. " (id: " .. client.id .. ", root: " .. (client.root_dir or "none") .. ")",
          ordinal = client.name,
        }
      end,
    }),
    sorter = Conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<C-j>", Actions.move_selection_next)
      map("i", "<C-k>", Actions.move_selection_previous)

      Actions.select_default:replace(function()
        local selection = ActionState.get_selected_entry()
        Actions.close(prompt_bufnr)
        if selection then
          local client = selection.value
          client:stop()  -- Future-proof: works now and in 0.13+
          print("Stopped LSP: " .. client.name)
        end
      end)

      return true
    end,
  }):find()
end

return {
  start = lsp_start_picker,
  stop = lsp_stop_picker,
}
