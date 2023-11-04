local load = require("utils").load

local M = {}

M.config = function()
  local autosave = load("autosave")
  local filters = load("autosave.filters")

  local options = {
    events = {
      register = true, -- Should autosave register its autocommands
      triggers = { -- The autocommands to register, if enabled
        "InsertLeave",
        "TextChanged",
      },
    },
    debounce = {
      enabled = false, -- Should debouncing be enabled
      delay = 1000, -- If enabled, only save the file at most every `delay` ms
    },
    filters = { -- The filters to apply, see above for all options.
      filters.writeable,
      filters.not_empty,
      filters.modified,
      -- exclude filetype
      filters.filetype("TelescopePrompt"),
      filters.filetype("NvimTree"),
      filters.filetype("vim"),
    },
  }

  autosave.setup(options)
end

return M
