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
    config = function()
      -- show json path in the winbar
      if vim.fn.exists("+winbar") == 1 then
        vim.opt_local.winbar = "%{%v:lua.require'jsonpath'.get()%}"
      end

      -- send json path to clipboard
      vim.keymap.set("n", "y<C-p>", function()
        vim.opt_local.winbar = "%{%v:lua.require'jsonpath'.get()%}"
        vim.fn.setreg("+", require("jsonpath").get())
      end, { desc = "Copy json path", buffer = true })
    end,
  },
  {
    'nvim-orgmode/orgmode',
    ft = 'org',
    config = function()
      require('orgmode').setup({
        org_agenda_files = { '~/playground/projects/org_files/*' },
        org_default_notes_file = '~/playground/projects/org_files/refile.org',
      })
    end
  }
}
