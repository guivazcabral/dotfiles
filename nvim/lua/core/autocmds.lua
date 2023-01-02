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
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.cmd([[autocmd BufRead,BufNewFile *.graphqls set filetype=graphql]])

vim.cmd [[
  " auto save 
  autocmd FocusLost * silent! wa
  autocmd BufLeave * silent! wa
  autocmd WinLeave * silent! wa
]]

-- Auto save last cursor position when closing buffer
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

return M
