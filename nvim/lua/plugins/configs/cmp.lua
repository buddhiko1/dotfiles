local load = require("utils").load

local M = {}

M.config = function()
  local cmp = load("cmp")
  local compare = load("cmp.config.compare")

  local options = {
    enabled = function()
      return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
    end,
    window = {
      -- default
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),

      -- custom
      completion = {
        border = "single",
      },
      documentation = {
        border = "single",
      },
    },
    formatting = {
      -- fields = { 'menu', 'abbr', 'kind' },
      format = function(entry, vim_item)
        vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
        vim_item.menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              look = "[Dict]",
              path = "[Path]",
            })[entry.source.name]
        local maxwidth = 80
        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
        return vim_item
      end,
    },
    mapping = {
          ["<CR>"] = cmp.mapping.confirm({
        -- behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
          ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, {
        "i",
        "s",
        "c",
      }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, {
        "i",
        "s",
        "c",
      }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "buffer" },
      { 
        name = 'look',
        keyword_length = 4,
        option = {
          convert_case = true,
          loud = true
          --dict = '/usr/share/dict/words'
        }
      },
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        compare.offset,
        compare.exact,
        compare.score,
        compare.recently_used,
        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      },
    },
  }

  cmp.setup(options)

  cmp.setup.cmdline(":", {
    sources = {
      { name = "cmdline" },
    },
  })
  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })
end

return M
