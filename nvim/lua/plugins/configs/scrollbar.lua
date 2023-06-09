local load = require("utils").load

local M = {}

M.config = function()
  local scrollbar = load("scrollview")
  local options = {
    excluded_filetypes = { "NvimTree" },
    current_only = true,
    winblend = 55, --ocupcity
    base = "right",
    column = 1,
  }
  scrollbar.setup(options)
end

return M
