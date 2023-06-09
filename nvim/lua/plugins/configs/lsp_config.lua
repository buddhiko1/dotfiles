local load = require("utils").load

local servers = {
  "cssls",
  "html",
  "tsserver",
  "graphql",
  "lua_ls",
  "dockerls",
  "yamlls",
  "jsonls",
  "angularls",
  "tailwindcss",
  "lemminx", -- xml
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


-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local _on_attach = function(client, bufnr)
  -- format on reading
  -- formatting(bufnr)

  -- formatting on save
  -- if client.supports_method("textDocument/formatting") then
  --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     group = augroup,
  --     buffer = bufnr,
  --     callback = function()
  --       lsp_formatting(bufnr)
  --     end,
  --   })
  -- end
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
    lspconfig[server].setup(options)
  end
end

return M
