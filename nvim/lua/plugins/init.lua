-- The setup key implies opt = true

local plugins = {
  ["lewis6991/impatient.nvim"] = {},
  ["wbthomason/packer.nvim"] = {},
  ["nvim-tree/nvim-web-devicons"] = {
    config = function()
      require("plugins.configs.icons").config()
    end,
  },

  ["numToStr/Comment.nvim"] = {
    config = function()
      require("plugins.configs.comment").setup()
      require("plugins.configs.comment").config()
    end,
  },
  ["kylechui/nvim-surround"] = {
    config = function()
      require("plugins.configs.surround").config()
    end,
  },
  ["xiyaowong/link-visitor.nvim"] = {
    config = function()
      require("plugins.configs.link_visitor").setup()
      require("plugins.configs.link_visitor").config()
    end,
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("plugins.configs.treesitter").config()
    end,
  },
  ["windwp/nvim-ts-autotag"] = {
    after = "nvim-treesitter",
  },
  ["nullishamy/autosave.nvim"] = {
    config = function()
      require("plugins.configs.autosave").config()
    end,
  },
  ["lewis6991/gitsigns.nvim"] = {
    config = function()
      require("plugins.configs.gitsigns").config()
    end,
  },
  -- motion plugin
  ["ggandor/leap.nvim"] = {
    config = function()
      require("plugins.configs.leap").setup()
      require("plugins.configs.leap").config()
    end,
  },
  -- color picker
  ["uga-rosa/ccc.nvim"] = {
    config = function()
      require("plugins.configs.ccc").setup()
      require("plugins.configs.ccc").config()
    end,
  },
  ["folke/noice.nvim"] = {
    event = "VimEnter",
    requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("plugins.configs.notify").setup()
      require("plugins.configs.notify").config()
      require("plugins.configs.noice").setup()
      require("plugins.configs.noice").config()
    end,
  },
  -- command finder
  ["mrjones2014/legendary.nvim"] = {
    requires = { "stevearc/dressing.nvim" },
    config = function()
      require("plugins.configs.legendary").setup()
      require("plugins.configs.legendary").config()
    end,
  },
  ["nvim-telescope/telescope.nvim"] = {
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.configs.telescope").setup()
      require("plugins.configs.telescope").config()
    end,
  },
  ["rafcamlet/tabline-framework.nvim"] = {
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.configs.tabline").setup()
      require("plugins.configs.tabline").config()
    end,
  },
  -- homepage
  ["goolord/alpha-nvim"] = {
    config = function()
      require("plugins.configs.alpha").setup()
      require("plugins.configs.alpha").config()
    end,
  },

  -- theme
  ['projekt0n/github-nvim-theme'] = {
    branch = "0.0.x"
  },

  -- status line
  ["nvim-lualine/lualine.nvim"] = {
    requires = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
    after = 'github-nvim-theme',
    config = function()
      require("plugins.configs.lualine").config()
    end,
  },
  ['nvim-tree/nvim-tree.lua'] = {
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.configs.nvim_tree").setup()
      require("plugins.configs.nvim_tree").config()
    end
  },
  ["ahmedkhalf/project.nvim"] = {
    config = function()
      require("plugins.configs.project").config()
    end,
  },
  ["dstein64/nvim-scrollview"] = {
    config = function()
      require("plugins.configs.scrollbar").config()
    end,
  },
  -- terminal
  ["numToStr/FTerm.nvim"] = {
    config = function()
      require("plugins.configs.fterm").setup()
      require("plugins.configs.fterm").config()
    end,
  },
  -- debug
  ["mfussenegger/nvim-dap"] = {
    config = function()
      require("plugins.configs.nvim_dap").setup()
      require("plugins.configs.nvim_dap").config()
    end,
  },
  ["theHamsta/nvim-dap-virtual-text"] = {
    config = function()
      require("plugins.configs.nvim_dap_text").setup()
      require("plugins.configs.nvim_dap_text").config()
    end,
  },
  ["rcarriga/nvim-dap-ui"] = {
    requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("plugins.configs.nvim_dap_ui").setup()
      require("plugins.configs.nvim_dap_ui").config()
    end,
  },
  -- complements
   ["L3MON4D3/LuaSnip"] = {
    config = function()
      require("plugins.configs.luasnip").config()
    end,
  },
  ["Exafunction/codeium.vim"] = {
    config = function()
      require("plugins.configs.codeium").setup()
      require("plugins.configs.codeium").config()
    end,
  },
  ["hrsh7th/nvim-cmp"] = {
    requires = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "octaltree/cmp-look",
      "hrsh7th/cmp-path"
    },
    config = function()
      require("plugins.configs.cmp").config()
    end,
  },
  ["windwp/nvim-autopairs"] = {
    config = function()
      require("plugins.configs.autopairs").config()
    end,
  },
  -- formmater and linter
  ["nvimdev/guard.nvim"] = {
    requires = { "nvimdev/guard-collection" },
    config = function()
      require("plugins.configs.guard").setup()
      require("plugins.configs.guard").config()
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require("plugins.configs.lsp_config").config()
    end,
  },
  ["nvimdev/lspsaga.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("plugins.configs.lsp_saga").setup()
      require("plugins.configs.lsp_saga").config()
    end,
  },
}

local to_list = function(pluginMap)
  local result = {}
  for key, _ in pairs(pluginMap) do
    pluginMap[key][1] = key

    result[#result + 1] = pluginMap[key]
  end
  return result
end

return to_list(plugins)
