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
  { 'tpope/vim-surround',         event = 'User AstroFile' },
  { 'dhruvasagar/vim-zoom',       event = 'User AstroFile' },
  { 'dhruvasagar/vim-table-mode', event = 'User AstroFile' },
  {
    'phelipetls/jsonpath.nvim',
    ft = 'json',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
