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
  { 'dhruvasagar/vim-zoom',       event = 'User AstroFile' },
  { 'dhruvasagar/vim-table-mode', event = 'User AstroFile' },
  { 'tpope/vim-fugitive',         event = 'VeryLazy' },
  { 'kylechui/nvim-surround',     event = 'User AstroFile', opts = {} },
  { 'David-Kunz/gen.nvim',        event = 'VeryLazy'},
  { 'sindrets/diffview.nvim',     event = 'User AstroGitFile'},
}
