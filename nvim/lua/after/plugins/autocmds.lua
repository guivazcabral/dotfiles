vim.cmd([[
  augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
  augroup end
]])

vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.http set filetype=http]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.cmd([[autocmd BufRead,BufNewFile *.graphqls set filetype=graphql]])
vim.cmd([[autocmd BufRead,BufNewFile *.graphql set filetype=graphql]])
vim.cmd([[autocmd BufRead,BufNewFile *.env.* set filetype=sh]])

vim.cmd([[autocmd BufRead,BufNewFile */node_modules/* lua vim.diagnostic.disable(0)]])

vim.cmd([[
  " auto save
  autocmd FocusLost * silent! wa
  autocmd BufLeave * silent! wa
  autocmd WinLeave * silent! wa
]])

-- Auto save last cursor position when closing buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})
