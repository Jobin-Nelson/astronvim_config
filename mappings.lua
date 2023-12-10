-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["|"] = false,
    ["<leader>o"] = false,
    ["<leader>h"] = false,
    -- buffers
    ["<leader>b"] = { name = "Buffers" }, -- this is useful for naming menus
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bo"] = { "<cmd>update <bar> %bdelete <bar> edit# <bar> bdelete #<CR>", desc = "Delete other buffers" },
    ["<leader>bD"] = { "<cmd>lua require('user.jobin.utils').delete_buffer()<cr>", desc = "Pick to close", },
    ["<leader>bh"] = { "<cmd>lua require('user.jobin.utils').delete_hidden_buffers()<cr>", desc =
    "Delete hidden buffers" },
    ["<leader>bR"] = { "<cmd>lua require('user.jobin.utils').rename_buffer()<cr>", desc = 'Rename buffer' },
    ["<leader>bk"] = { "<cmd>call delete(expand('%:p')) <bar> bdelete!<cr>", desc = 'Kill buffer & delete file' },
    -- telescope
    ['<leader>fO'] = { "<cmd>lua require('user.jobin.utils').find_org_files()<cr>", desc = 'Find Org Files' },
    ['<leader>fs'] = { "<cmd>lua require('user.jobin.utils').find_second_brain_files()<cr>", desc =
    'Find Second Brain Files' },
    ['<leader>fd'] = { "<cmd>lua require('user.jobin.utils').find_dotfiles()<cr>", desc = 'Find Dotfiles' },
    ['<leader>fp'] = { "<cmd>lua require('user.jobin.my_pickers').find_projects()<cr>", desc = 'Find projects' },
    ['<leader>fz'] = { "<cmd>lua require('user.jobin.my_pickers').find_zoxide()<cr>", desc = 'Find projects' },
    ['<leader>fj'] = { "<cmd>lua require('user.jobin.my_pickers').find_journal()<cr>", desc = 'Find Journal' },
    -- terminal
    ['<A-h>'] = { '<cmd>ToggleTerm size=20 direction=horizontal<cr>', desc = 'ToggleTerm horizontal split' },
    ['<A-v>'] = { '<cmd>ToggleTerm size=80 direction=vertical<cr>', desc = 'ToggleTerm vertical split' },
    -- others
    ["<leader>sc"] = { "<cmd>lua require('user.jobin.utils').scratch_buffer()<cr>", desc = "Scratch buffer" },
    ['<leader>se'] = { "<cmd>lua require('user.jobin.work_stuff.email_update').open()<cr>", desc = 'Send Email Update' },
    ['<leader>ss'] = { ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', desc = 'Substitute word' },
    ['<leader>st'] = { "<cmd>lua require('user.jobin.work_stuff.get_ticket').populate_ticket()<cr>", desc =
    'Source Ticket' },
    ['<leader>sj'] = { "<cmd>lua require('user.jobin.utils').start_journal()<cr>", desc = 'Start Journal' },
    ['<leader>sr'] = { "<cmd>lua require('user.jobin.work_stuff.test_tracking').generate_csv()<cr>", desc = 'Test Tracking' },
    ['<leader>oT'] = { "<cmd>lua require('user.jobin.org-tangle').tangle()<cr>", desc = 'Org Tangle' },
    [']q'] = { "<cmd>cnext<cr>", desc = 'Next QuickFix' },
    ['[q'] = { "<cmd>cprevious<cr>", desc = 'Previous QuickFix' },
  },
  v = {
    ['<'] = { '<gv', desc = "Indent inward" },
    ['>'] = { '>gv', desc = "Indent outward" },
    ['P'] = { '"_dP', desc = "Paste without yanking" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ['<A-h>'] = { '<esc><cmd>ToggleTerm direction=horizontal<cr>', desc = 'ToggleTerm horizontal split' },
    ['<A-v>'] = { '<esc><cmd>ToggleTerm direction=vertical<cr>', desc = 'ToggleTerm vertical split' },
    ['<C-w>'] = { '<C-\\><C-n><C-w>', desc = 'ToggleTerm window command' },
  },
}
