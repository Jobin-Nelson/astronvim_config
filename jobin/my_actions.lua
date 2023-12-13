local action_state = require('telescope.actions.state')

local M = {}

function M.copy_entry(_)
  local selection = action_state.get_selected_entry().value
  local cwd = vim.loop.cwd()
  -- converting to relative path if the file is under cwd
  if string.match(selection, '^' .. cwd) then
    selection = string.sub(selection, #cwd + 2)
  end
  vim.fn.setreg('+', selection)
  print('Copied ' .. selection)
end

return M
