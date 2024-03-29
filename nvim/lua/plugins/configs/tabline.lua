local load = require("utils").load
local map = require("utils").map

local _display_render = function(f)
  f.make_tabs(function(info)
    local icon_color = f.icon_color(info.filename)
    if info.current then
      f.set_fg(icon_color)
    end
    f.add("  ")
    if info.filename then
      f.add(info.filename)
      f.add(" " .. f.icon(info.filename))
      f.add(" ")
    elseif vim.bo.filetype then
      f.add(vim.bo.filetype)
    else
      f.add("[no name]")
    end
    f.add(" ")
  end)

  f.add_spacer()
  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  if errors > 0 then
    f.add({ errors .. "  ", fg = "#e86671" })
  end
end

local _is_hiding_filetype = function()
  local _disable_file_types = { "alpha", "TelescopePromt" }
  for _, filetype in ipairs(_disable_file_types) do
    if vim.bo.filetype == filetype then
      return true
    end
  end
  return false
end

local _draw_tabline = function()
  local tabline = load("tabline_framework")
  tabline.setup({
    render = _display_render,
    -- hl = { fg = palette.fg1, bg = palette.bg1 },
    -- hl_sel = { fg = palette.fg1, bg = palette.green.bright },
    -- hl_fill = { fg = palette.fg0, bg = palette.bg0 }
  })
end

local M = {}

M.setup = function()
  map("n", ";", "<cmd> :wq! <CR>")
  map("n", "L", "<cmd> :tabnext <CR>")
  map("n", "H", "<cmd> :tabprevious <CR>")
end

M.config = function()
  vim.api.nvim_create_autocmd({ "BufRead" }, {
    callback = function()
      if not _is_hiding_filetype() then
        _draw_tabline()
      end
    end,
  })
end

return M
