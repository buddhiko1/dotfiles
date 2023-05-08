local load = require("utils").load

local M = {}

M.config = function()
  local devicons = load("nvim-web-devicons")

  local options = {
    override = {
    },
  }

  devicons.setup(options)
end

return M
