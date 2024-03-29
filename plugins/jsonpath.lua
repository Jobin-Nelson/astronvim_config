return {
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
  }
