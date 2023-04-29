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
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    ["<leader>bo"] = { "<cmd>update <bar> %bdelete <bar> edit# <bar> bdelete #<CR>", desc = "Delete other buffers" },
    ["<leader>bv"] = { function()
      local all_bufs = vim.tbl_filter(
        function(buf)
          return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
        end,
        vim.api.nvim_list_bufs()
      )
      local all_wins = vim.api.nvim_list_wins()
      local visible_bufs = {}
      for _, win in ipairs(all_wins) do
        visible_bufs[vim.api.nvim_win_get_buf(win)] = true
      end

      for _, buf in ipairs(all_bufs) do
        if visible_bufs[buf] == nil then
          vim.cmd.bwipeout({ count = buf, bang = true })
        end
      end
      print('All hidden buffers have been deleted')
    end, desc = "Delete hidden buffers" },
    ["<leader>sc"] = { function()
      if vim.g.scratch_nr then
        local buf_nr = vim.g.scratch_nr
        local win_ids = vim.fn.win_findbuf(buf_nr)
        if win_ids then
          for _, win_id in ipairs(win_ids) do
            if vim.api.nvim_win_is_valid(win_id) then
              vim.api.nvim_set_current_win(win_id)
              return
            end
          end
        end
        vim.cmd('vert sbuffer ' .. buf_nr)
        return
      end

      local buf_nr = vim.api.nvim_create_buf(false, true)
      vim.opt_local.buftype = 'nofile'
      vim.opt_local.bufhidden = 'hide'
      vim.opt_local.swapfile = false
      vim.api.nvim_buf_set_name(buf_nr, 'scratch')
      vim.g.scratch_nr = buf_nr
      vim.cmd('vert sbuffer ' .. buf_nr)
    end, desc = "Scratch buffer" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
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
