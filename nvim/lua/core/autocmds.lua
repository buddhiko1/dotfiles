local autocmd = vim.api.nvim_create_autocmd
local log = require("utils").log
local active_theme = require("utils").active_theme

autocmd({ "VimEnter" }, {
  callback = function()
    vim.g.log = log
    vim.cmd("set laststatus=0")
    vim.cmd("set nofoldenable")
    active_theme()
  end,
})

autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd("!kill -9 node")
  end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 2500 })
  end,
})

autocmd("BufUnload", {
  buffer = 0,
  desc = "enable status, tabline and cmdline after alpha",
  callback = function()
    vim.cmd("set showtabline=2")
  end,
})
