local function get_dotfiles()
  local econf_file = vim.fn.expand('~/.local/bin/econf.sh')

  local econf = io.open(econf_file, 'r')
  if econf == nil then
    error('No econf.sh file found')
  end

  -- Seek till Files=(
  for line in econf:lines() do
    if string.match(line, '^%s*FILES=%(') then break end
  end

  -- Read in dotfiles
  local dotfiles = {}
  for line in econf:lines() do
    if string.match(line, '^%s*$') then break end
    local file_path = string.match(line, '.* - (.*)"$')
    table.insert(dotfiles, file_path)
  end

  if vim.tbl_isempty(dotfiles) then
    error('No dotfiles found in array FILES in econf.sh')
  end

  econf:close()
  return dotfiles
end

local M = {}

M.delete_buffer = function()
  require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
    require("astronvim.utils.buffer").close(
      bufnr)
  end)
end

M.delete_hidden_buffers = function()
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
end

M.scratch_buffer = function()
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
  vim.api.nvim_buf_set_name(buf_nr, 'scratch')
  vim.g.scratch_nr = buf_nr
  vim.cmd.vnew()
  vim.api.nvim_win_set_buf(0, buf_nr)
end

M.find_org_files = function()
  require('telescope.builtin').find_files({
    search_dirs = {
      '~/playground/projects/org_files/',
      '~/playground/dev/illumina/ticket_notes/work/',
    },
    prompt_title = 'Org Files',
  })
end

M.find_second_brain_files = function()
  require('telescope.builtin').find_files({
    search_dirs = { '~/playground/projects/second_brain' },
    prompt_title = 'Second Brain Files',
  })
end

M.find_dotfiles = function()
  require('telescope.builtin').find_files({
    search_dirs = get_dotfiles(),
    prompt_title = 'Find Dotfiles',
  })
end

M.rename_buffer = function()
  local original_filename = vim.api.nvim_buf_get_name(0)
  local prompt = 'Rename: '

  local new_filename = vim.fn.input({
    prompt = prompt,
    default = original_filename,
    completion = 'file',
  })

  if new_filename == '' then
    return
  end

  vim.cmd('update | saveas ++p ' .. new_filename)
  local alternate_bufnr = vim.fn.bufnr('#')
  if vim.fn.bufexists(alternate_bufnr) then
    vim.api.nvim_buf_delete(alternate_bufnr, {})
  end
  vim.fn.delete(original_filename)
  print('Renamed to ' .. new_filename)
end

-- Journal stuff
local journal_dir = '~/playground/projects/second_brain/Resources/journal/'
M.journal_today = function()
  local journal_path = vim.fs.normalize(string.format('%s/%s.md', journal_dir, os.date('%Y-%m-%d')))
  vim.cmd('tabedit ' .. journal_path)
end

M.journal_search = function()
  require('telescope.builtin').live_grep({
    prompt_title = 'Journal Search',
    search_dirs = {journal_dir}
  })
end

-- vim.keymap.set('n', '<leader>rt', M.journal_search)
-- vim.keymap.set('n', '<leader>rr', ':update | luafile %<cr>')

return M
