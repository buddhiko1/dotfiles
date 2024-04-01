local _HOME = os.getenv("HOME")
local _DEBUGGER_DIR = _HOME .. "/App"

local M = {
  shell_open_cmd =  os.getenv("SHELL"),
  debugger_dir = _DEBUGGER_DIR,
}

return M
