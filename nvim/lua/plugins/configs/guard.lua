local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>sm", "<cmd>GuardFmt<CR>")
end

M.config = function()
  local ft = load('guard.filetype')
  ft('typescript,javascript,css,html,markdown'):fmt('prettier')

  local guard = load("guard")
  local options = {
    fmt_on_save = true,
    lsp_as_default_formatter = true
  }
  guard.setup(options)
end
return M
