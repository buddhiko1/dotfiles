local load = require("utils").load

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "rust_analyzer",
  "cssls",
  "html",
  "tsserver",
  -- "volar",
  "graphql",
  "dockerls",
  "yamlls",
  "jsonls",
  "angularls",
  "tailwindcss",
  "ltex"
}

local _config_diagnostic = function()
  -- ui
  local signs = { Error = " ", Warn = " ", Hint = " 󰌵", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    virtual_text = false,
  })
end

local _lsp_flags = {
  debounce_text_changes = 150,
}

local _on_attach = function(client, bufnr)
end

local M = {}

M.config = function()
  _config_diagnostic()

  require("lspconfig.ui.windows").default_options.border = "single"

  local lspconfig = load("lspconfig")

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  for _, server in pairs(servers) do
    local options = {
      capabilities = capabilities,
      on_attach = _on_attach,
      flags = _lsp_flags,
    }

    server = vim.split(server, "@")[1]
    local require_ok, server_option = pcall(require, "plugins.configs.lsp_servers." .. server)
    if require_ok then
      options = vim.tbl_deep_extend("force", server_option, options)
    end
    if server == "ltex" then
      if vim.bo.filetype == "markdown" then
        lspconfig[server].setup(options)
      end
    else
      lspconfig[server].setup(options)
    end
  end
end

return M
