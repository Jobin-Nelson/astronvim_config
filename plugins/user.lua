return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  { 'kevinhwang91/nvim-ufo', enabled = false },
  {
    'hrsh7th/nvim-cmp',
    opts = function(_, opts)
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then return opts end

      local cmp = require "cmp"
      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" })
      opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })
      return opts
    end,
  },
}
