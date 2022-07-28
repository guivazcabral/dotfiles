local M = {}

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

vim.cmd [[
  augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
  augroup end
]]

vim.cmd [[
  augroup dashboard_settings
    autocmd!
    autocmd FileType dashboard set showtabline=0
    autocmd BufWinLeave <buffer> set showtabline=2
    autocmd BufEnter * if &ft is "dashboard" | set laststatus=0 | else | set laststatus=2 | endif
    autocmd BufEnter * if &ft is "dashboard" | set nocursorline | endif
  augroup end
]]

vim.cmd [[
  command! NeovimUpdate lua require('core.utils').update()
]]

vim.cmd 'autocmd BufRead,BufNewFile *.ex,*.exs,mix.lock set filetype=elixir'
vim.cmd 'autocmd BufRead,BufNewFile *.rb,*.rake,Gemfile.lock,Gemfile,*.erb,*.haml set filetype=ruby'
vim.cmd 'autocmd FileType go setlocal expandtab shiftwidth=4 tabstop=4'

vim.cmd [[
  " auto save 
  autocmd FocusLost * silent! wa
  autocmd BufLeave * silent! wa
  autocmd WinLeave * silent! wa
]]

return M
