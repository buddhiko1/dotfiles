local load = require("utils").load

local M = {}

M.config = function()
  local blankline = load("ibl")

  local options = {
    indent = { char = "▏" },
    exclude = {
      "help",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "lsp-installer",
      "",
    }
  }

  blankline.setup(options)
end

return M
