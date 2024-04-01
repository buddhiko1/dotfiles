local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<C-n>", "<cmd>lua require('FTerm').toggle()<CR>")
  map("t", "<C-n>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")
  map("t", "<C-q>", "<C-\\><C-n><CMD>lua require('FTerm').exit()<CR>")
  map("t", "<Esc>", "<C-\\><C-n>") -- to scroll
end

M.config = function()
  local fterm = load("FTerm")
  local options = {
    cmd = require("constants").shell_open_cmd,
    border = "single",
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  }

  fterm.setup(options)

  local gitui = fterm:new({
    ft = "gitui",
    cmd = "~/.config/nvim/lint.sh && ssh-add ~/.ssh/id_ed25519 && gitui",
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  })
  map("n", "<leader>mm", function()
    gitui:open()
  end)

  local btop = fterm:new({
    ft = "fterm_btop",
    cmd = "btop",
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  })
  map("n", "<leader>i", function()
    btop:toggle()
  end)
end

return M
