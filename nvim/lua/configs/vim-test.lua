vim.g['test#strategy'] = 'vimux'

vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>TestNearest<CR>', { noremap = true, silent = true}) -- Test nearest test
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>TestFile<CR>', { noremap = true, silent = true}) -- Test file
vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>TestLast<CR>', { noremap = true, silent = true}) -- Test last test run
