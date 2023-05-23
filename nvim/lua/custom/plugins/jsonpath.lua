return {
  'mogelbrod/vim-jsonpath',
  event = "VeryLazy",
  config = function()
    vim.cmd([[ let g:jsonpath_register = '*' ]])
  end
}
