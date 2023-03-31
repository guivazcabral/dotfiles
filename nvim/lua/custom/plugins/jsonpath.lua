return {
  'mogelbrod/vim-jsonpath',
  config = function()
    vim.cmd([[ let g:jsonpath_register = '*' ]])
  end
}
