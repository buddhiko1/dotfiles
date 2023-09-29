string.trim = function(s)
  return s:gsub("^%s+", ""):gsub("%s+$", "")
end

local _highlight_cursor = function(is_day_theme)
  if is_day_theme then
    vim.cmd("highlight Cursor guibg=black guifg=white")
    vim.cmd("set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20")
  else
    vim.cmd("highlight Cursor guibg=#991b1b guifg=white")
    vim.cmd("set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor")
  end
end

local M = {}

M.map = function(mode, keys, command, opts)
  local options = opts or {}
  options.noremap = true
  options.silent = true
  vim.keymap.set(mode, keys, command, options)
end

M.load = function(plugin)
  local present, loaded = pcall(require, plugin)
  if not present then
    error("Couldn't load " .. plugin .. "\n")
  end
  return loaded
end

M.log = function(text)
---@diagnostic disable-next-line: different-requires
  local notify = require("notify")
  notify(text, "error", {
    title = "Debug",
    icon = "",
  })
end

M.get_alacritty_theme = function ()
  local handle = io.popen('alacritty-themes --current')
---@diagnostic disable-next-line: need-check-nil
  local alacritty_theme = handle:read('*line'):trim()
---@diagnostic disable-next-line: need-check-nil
  handle:close()
  return alacritty_theme 
end

M.active_theme = function ()
  local alacritty_theme = M.get_alacritty_theme()
  local is_day_theme = false
  if alacritty_theme == "github_dark" then
    vim.cmd("colorscheme github_dark")
  else
    vim.cmd("colorscheme github_light")
    is_day_theme = true
  end
  _highlight_cursor(is_day_theme)
end

M.is_file_exists = function(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

M.getFileExtensionFromPath = function(path)
  local str = path
  local temp = ""
  local result = "."

  for i = str:len(), 1, -1 do
    if str:sub(i, i) ~= "." then
      temp = temp .. str:sub(i, i)
    else
      break
    end
  end

  for j = temp:len(), 1, -1 do
    result = result .. temp:sub(j, j)
  end

  return result
end

M.disable_mapping_at = function(filetype)
  return vim.bo.filetype ~= filetype
end

M.print_table = function(data)
  for k, v in pairs(data) do
    print("data[" .. k .. "]", v)
  end
end
return M
