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
    ["<leader>bD"] = { require('user.custom.utils').delete_buffer, desc = "Pick to close", },
    ["<leader>bo"] = { "<cmd>update <bar> %bdelete <bar> edit# <bar> bdelete #<CR>", desc = "Delete other buffers" },
    ["<leader>bh"] = { require('user.custom.utils').delete_hidden_buffers, desc = "Delete hidden buffers" },
    ["<leader>sc"] = { require('user.custom.utils').scratch_buffer, desc = "Scratch buffer" },
    ['<leader>ss'] = { ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', desc = 'Substitute word' },
    ['<leader>fO'] = { require('user.custom.utils').find_org_files, desc = 'Find Org Files' },
    ['<leader>fs'] = { require('user.custom.utils').find_second_brain_files, desc = 'Find Second Brain Files' },
    ['<leader>fd'] = { require('user.custom.utils').find_dotfiles, desc = 'Find Dotfiles' },
    ['<leader>se'] = { require('user.custom.utils').email_update, desc = 'Send Email Update' },
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
