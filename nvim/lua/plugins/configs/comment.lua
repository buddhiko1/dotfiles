local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>/", "<cmd> :lua require('Comment.api').toggle.linewise.current()<CR>")
  map("v", "<leader>/", "<esc><cmd> :lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
end

M.config = function()
  local comment = load("Comment")

  local options = {
    opleader = {
      line = "tl",
      block = "tb",
    },
    extra = {
      above = "to",
      below = "tO",
      eol = "te", -- Add comment at the end of line
    },
  }

  comment.setup(options)
end

return M
