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
    event = 'VeryLazy',
    lazy = false,
    config = function()
      require('orgmode').setup_ts_grammar()
      require('orgmode').setup({
        org_agenda_files = {
          '~/playground/projects/org_files/**/*',
          '~/playground/dev/illumina/ticket_notes/work_org_files/**/*',
        },
        org_default_notes_file = '~/playground/projects/org_files/refile.org',
        org_todo_keywords = { 'TODO(t)', 'NEXT(n)', '|', 'DONE(d)', 'CANCELLED(c)' },
        org_archive_location = '~/playground/projects/org_files/archive_file.org',
        org_hide_leading_stars = false,
        org_hide_emphasis_markers = true,
        org_agenda_span = 'day',
        org_blank_before_new_entry = { heading = false, plain_list_item = false },
        org_indent_mode = 'noindent',
        org_log_into_drawer = 'LOGBOOK',
      })

      for _, key in ipairs({ '=', '~'}) do
        vim.keymap.set('v', 'i'..key, string.format('t%soT%s', key, key), { desc = string.format('inner org %s', key) })
        vim.keymap.set('v', 'a'..key, string.format('f%soF%s', key, key), { desc = string.format('around org %s', key) })
        vim.keymap.set('o', 'i'..key, string.format('<cmd>normal! t%svT%s<CR>', key, key), { desc = string.format('inner org %s', key) })
        vim.keymap.set('o', 'a'..key, string.format('<cmd>normal! f%svF%s<CR>', key, key), { desc = string.format('around org %s', key) })
      end
    end
  },
  {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    cmd = 'TSPlaygroundToggle',
  },
  {
    'David-Kunz/gen.nvim',
    event = 'VeryLazy',
  }
}
