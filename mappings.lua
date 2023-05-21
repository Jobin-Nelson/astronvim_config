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
    ["<leader>b"] = { name = "Buffers" }, -- this is useful for naming menus
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bo"] = { "<cmd>update <bar> %bdelete <bar> edit# <bar> bdelete #<CR>", desc = "Delete other buffers" },
    ["<leader>bD"] = { "<cmd>lua require('user.jobin.utils').delete_buffer()<cr>", desc = "Pick to close", },
    ["<leader>bh"] = { "<cmd>lua require('user.jobin.utils').delete_hidden_buffers()<cr>", desc =
    "Delete hidden buffers" },
    ["<leader>sc"] = { "<cmd>lua require('user.jobin.utils').scratch_buffer()<cr>", desc = "Scratch buffer" },
    ['<leader>se'] = { "<cmd>lua require('user.jobin.utils').email_update()<cr>", desc = 'Send Email Update' },
    ['<leader>ss'] = { ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', desc = 'Substitute word' },
    ['<leader>fO'] = { "<cmd>lua require('user.jobin.utils').find_org_files()<cr>", desc = 'Find Org Files' },
    ['<leader>fs'] = { "<cmd>lua require('user.jobin.utils').find_second_brain_files()<cr>", desc =
    'Find Second Brain Files' },
    ['<leader>fd'] = { "<cmd>lua require('user.jobin.utils').find_dotfiles()<cr>", desc = 'Find Dotfiles' },
    ['<leader>fp'] = { "<cmd>lua require('user.jobin.my_pickers').find_projects()<cr>", desc = 'Find projects' },
    ['<leader>fz'] = { "<cmd>lua require('user.jobin.my_pickers').find_zoxide()<cr>", desc = 'Find projects' },
    ['<leader>oT'] = { "<cmd>lua require('user.jobin.org-tangle').tangle()<cr>", desc = 'Org Tangle' },
  },
  v = {
    ['<'] = { '<gv', desc = "Indent inward" },
    ['>'] = { '>gv', desc = "Indent outward" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
