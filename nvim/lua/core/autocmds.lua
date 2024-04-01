local autocmd = vim.api.nvim_create_autocmd
local log = require("utils").log
local active_theme = require("utils").active_theme

autocmd({ "VimEnter" }, {
  callback = function()
    vim.g.log = log
    vim.cmd("set laststatus=0")
    vim.cmd("set nofoldenable")
    vim.cmd("set showtabline=2")
    active_theme()
  end,
})

-- fix debugger bug
-- autocmd({ "VimLeave" }, {
--   callback = function()
--     vim.cmd("!kill -9 node")
--   end,
-- })

-- Highlight yanked text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 2000 })
  end,
})
