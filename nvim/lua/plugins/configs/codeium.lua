local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  -- map to Alt key
  map("i", "<M-l>", function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
  map("i", "<M-h>", function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
  map("i", "<M-k>", function() return vim.fn['codeium#Clear']() end, { expr = true })
  map("i", "<M-j>", function() return vim.fn['codeium#Accept']() end, { expr = true })
  map("i", "<M-Bslash>", function() return vim.fn['codeium#Complete']() end, { expr = true })
end

M.config = function()
  vim.g.codeium_disable_bindings = 1
end

return M
