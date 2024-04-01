local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map({ "n", "v" }, "<leader>mc", function()
    require("notify").dismiss({ pending = true, silent = true })
  end)
  map({ "n", "v" }, "<leader>me", "<cmd>:messages<CR>")
end

M.config = function()
  local notify = load("notify")
  local options = {
    background_colour = "#000000",
    level = 3, -- warning
    minimum_width = 50,
    render = "compact",
    stages = "fade",
    timeout = 2500,
  }
  notify.setup(options)
end
return M
