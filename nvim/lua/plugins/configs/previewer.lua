local map = require("utils").map

local M = {}

M.setup = function()
  map({ "n" }, "<leader>p", "<cmd>:MarkdownPreview solarized-light<CR>")
end

M.config = function()
end

return M
