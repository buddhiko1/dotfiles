local load = require("utils").load

local M = {}

M.config = function()
  local lsp_signature = load("lsp_signature")

  local options = {
    bind = true,
    doc_lines = 0,
    floating_window = true,
    hint_enable = false,
    fix_pos = true,
    hint_prefix = "󰌵 ",
    hint_scheme = "String",
    hi_parameter = "Search",
    max_height = 22,
    max_width = 120,
    handler_opts = {
      border = "single",
    },
    zindex = 200,
    padding = "",
  }

  lsp_signature.setup(options)
end

return M
