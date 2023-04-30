local _is_windows = function()
  return vim.loop.os_uname().sysname == "Windows_NT"
end

local _HOME = _is_windows() and "C:/Users/shun" or os.getenv("HOME")
local _DEBUGGER_DIR = _HOME .. (_is_windows() and "/Documents/Software" or "/Software")

local M = {
  shell_open_cmd = _is_windows() and "powershell /nologo" or os.getenv("SHELL"),
  debugger_dir = _DEBUGGER_DIR,
}

return M
