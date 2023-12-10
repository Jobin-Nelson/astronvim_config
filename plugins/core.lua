return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
        "",
        "           [[ Jobin Nelson ]]",
      }
      return opts
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    config = function(plugin, opts)
      require "plugins.configs.luasnip" (plugin, opts) -- include the default astronvim config that calls the setup call
      require('luasnip.loaders.from_lua').load({ paths = { "./lua/user/snippets" } })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      local luasnip = require('luasnip')
      opts.mapping['<Tab>'] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" })
      opts.mapping['<S-Tab>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })
      opts.sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'orgmode' },
      }
      return opts
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "ghassan0/telescope-glyph.nvim",
      "xiyaowong/telescope-emoji.nvim",
    },
    config = function(plugin, opts)
      local actions = require "telescope.actions"
      opts.defaults.mappings.i["<C-n>"] = actions.move_selection_next
      opts.defaults.mappings.i["<C-p>"] = actions.move_selection_previous
      opts.defaults.mappings.i["<C-j>"] = actions.cycle_history_next
      opts.defaults.mappings.i["<C-k>"] = actions.cycle_history_prev
      opts.pickers = {
        buffers = {
          mappings = {
            n = {
              ['d'] = 'delete_buffer'
            }
          }
        }
      }
      require('plugins.configs.telescope')(plugin, opts)
      local telescope = require('telescope')
      telescope.load_extension('emoji')
      telescope.load_extension('glyph')
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require("astronvim.utils.status")
      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },
        status.component.mode(),
        status.component.git_branch(),
        status.component.file_info { filetype = false, filename = {}, file_modified = {} },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
        status.component.mode { surround = { separator = "right" } },
      }

      return opts
    end,
  },
}
