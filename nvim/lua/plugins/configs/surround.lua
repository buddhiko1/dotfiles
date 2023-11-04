local load = require("utils").load

local M = {}

M.config = function()
  local surround = load("nvim-surround")

  local options = {
    move_cursor = false,
  }

  surround.setup(options)
end
return M
