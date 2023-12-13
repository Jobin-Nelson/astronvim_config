local action_state = require('telescope.actions.state')

local M = {}

function M.copy_entry(_)
  local selection = action_state.get_selected_entry().value
  local cwd = vim.fn.getcwd(0)
  local relative_path = string.sub(selection, #cwd + 2)
  vim.fn.setreg('+', relative_path)
  print('Copied ' .. relative_path)
end

return M
