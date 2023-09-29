local load = require("utils").load
local map = require("utils").map
local disable_mapping_at = require("utils").disable_mapping_at

local M = {}

M.setup = function()
  map("n", "<leader>;", function()
    return disable_mapping_at("alpha") and vim.cmd("NvimTreeToggle")
  end)
  map("n", "<leader>[", "<cmd> :NeoTreeFloatToggle <CR>")
end


local on_attach = function(bufnr)
  local api = require('nvim-tree.api')
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  -- override mappings
  map("n", "t", api.node.open.tab_drop, opts('New tab'))
  map("n", "v", api.node.open.vertical, opts('Vertical'))
  map("n", "R", api.tree.reload, opts('Refresh'))
  map("n", "?", api.tree.toggle_help, opts('Help'))
  map("n", ".", api.tree.toggle_hidden_filter, opts('Hidden'))
  map('n', '<CR>',  api.node.open.tab_drop, opts('New tab'))
end


local options = {
  auto_reload_on_write = false,
  disable_netrw = true,
  sort_by = "name",
  on_attach = on_attach,
  update_focused_file = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    debounce_delay = 1000,
    severity = {
      min = vim.diagnostic.severity.WARNING,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = " 󰌵",
      info = " ",
      warning = " ",
      error = " ",
    },
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 500,
  },
  view = {
    debounce_delay = 100,
    width = {
      max = 50,
      padding = 2
    },
    side = "right",
  },
  renderer = {
    highlight_opened_files = "all",
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = "after",
      modified_placement = "after",
      padding = " ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          deleted = "",
          renamed = "",
          untracked = "󰢤",
          ignored = "",
          unstaged = "",
          staged = "",
          unmerged = "",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  filters = {
    dotfiles = true,
  },
  live_filter = {
    prefix = "/: ",
    always_show_folders = true,
  },
  tab = {
    sync = {
      open = true,
      close = true,
      ignore = {},
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
  },
  ui = {
    confirm = {
      remove = true,
      trash = true,
    },
  },
  experimental = {
    git = {
      async = true,
    },
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
}

M.config = function()
  local neotree = load("nvim-tree")
  neotree.setup(options)
end

return M
