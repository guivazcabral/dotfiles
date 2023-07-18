local opts = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap

-- Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Close buffer
map("n", "Q", "<cmd>Bdelete!<CR>", opts)
map("n", "<C-w>q", "<cmd>%bd|e#<CR>", opts) -- Close all but current buffer

-- Split windows
map("n", "vv", "<C-w>v", opts)
map("n", "ss", "<C-w>s", opts)

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Disabling arrow keys
map("n", "<Left>", ":echoe 'Use h'<CR>", opts)
map("n", "<Right>", ":echoe 'Use l'<CR>", opts)
map("n", "<Up>", ":echoe 'Use k'<CR>", opts)
map("n", "<Down>", ":echoe 'Use j'<CR>", opts)

-- Replace to better go to the beginning of the line
map("n", "0", "^", opts)
map("n", "^", "0", opts)

-- Copy filepath
map("n", "<leader>cs", ":let @+=fnamemodify(expand('%'), ':~:.')<CR>", opts)

-- Resize with arrows
map("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)
map("n", "<leader>,", "<cmd>b#<CR>", opts)

-- Move text up and down
map("n", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)

-- NeoTree
map("n", "<leader>ee", "<cmd>Neotree reveal toggle<CR>", opts)
map("n", "<leader>e", "<cmd>Neotree reveal<CR>", opts)

-- NavBuddy
map("n", "<leader>nb", "<cmd>Navbuddy<CR>", opts)

-- Gitsigns
map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", opts)
map("n", "<leader>hH", "<cmd>Gitsigns reset_hunk<CR>", opts)
map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>", opts)

-- LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", opts)

-- Neogit
map("n", "<leader>ng", "<cmd>Neogit<CR>", opts)

-- LSPSaga
map("n", "<M-CR>", "<cmd>Lspsaga code_action<cr>", opts)
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "<leader>gR", "<cmd>Lspsaga finder<CR>", opts)

-- Open diagnostics
map("n", "<C-p>", "<cmd>TroubleToggle<CR>", opts)

-- Json Path
map("n", "<leader>jp", "<cmd>JsonPath<CR>", opts)

-- Run tests
map("n", "<leader>tt", "<cmd>lua require('neotest').run.run()<CR>", opts)
map("n", "<leader>ts", "<cmd>lua require('neotest').summary.open()<CR>", opts)

-- Logsitter
map("n", "<leader>lg", "<cmd>lua require('logsitter').log()<CR>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Screenshots
map("v", "<leader>ms", "<esc><cmd>lua require('silicon').visualise_api({to_clip = true})<CR>", opts)
