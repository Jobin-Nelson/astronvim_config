-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true,         -- sets vim.opt.number
    spell = false,         -- sets vim.opt.spell
    signcolumn = "yes",    -- sets vim.opt.signcolumn to auto
    wrap = false,          -- sets vim.opt.wrap
    scrolloff = 8,
    sidescrolloff = 10,
    cursorline = false,
    conceallevel = 2,
    cmdheight = 1,
    linebreak = true,
    breakindent = true,
    breakindentopt = 'list:2,min:20,sbr',
    updatecount = 0,
    -- showbreak = '>',
    diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" },
    -- iskeyword = vim.opt.iskeyword + '-',
    formatoptions = vim.opt.formatoptions
        - "a"  -- Auto formatting is BAD.
        - "t"  -- Don't auto format my code. I got linters for that.
        + "c"  -- In general, I like it when comments respect textwidth
        + "q"  -- Allow formatting comments w/ gq
        - "o"  -- O and o, don't continue comments
        + "r"  -- But do continue when pressing enter.
        + "n"  -- Indent past the formatlistpat, not underneath it.
        + "j"  -- Auto-remove comments if possible.
        - "2", -- I'm not in gradeschool anymore
  },
  g = {
    mapleader = " ",                 -- sets vim.g.mapleader
    autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true,              -- enable completion at start
    autopairs_enabled = true,        -- enable autopairs at start
    diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true,            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    loaded_python3_provider = 0,
    loaded_node_provider = 0,
    git_worktrees = {
      {
        toplevel = vim.env.HOME,
        gitdir = vim.env.HOME .. '/.dotfiles',
      },
    }
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
