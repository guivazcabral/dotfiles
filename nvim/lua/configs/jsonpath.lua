local M = {}

function M.config()
  vim.cmd([[ let g:jsonpath_register = '*' ]])
end

return M
