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
map("n", "<C-w>Q", "<cmd>%bd|e#<CR>", opts) -- Close all but current buffer

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

-- Move text up and down
map("n", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)

-- NvimTree
map("n", "<leader>ee", "<cmd>NeoTreeRevealToggle<CR>", opts)
map("n", "<leader>e", "<cmd>NeoTreeReveal<CR>", opts)

-- Telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", opts)
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
map("n", "<leader>fr", "<cmd>Telescope registers<CR>", opts)

-- NavBuddy
map("n", "<leader>nb", "<cmd>Navbuddy<CR>", opts)

-- Json Path
map("n", "<leader>jp", "<cmd>JsonPath<CR>", opts)

-- Run tests
map("n", "<leader>t", "<cmd>TestFile<CR>", opts)

-- Logsitter this is so hacky it hurts
vim.keymap.set("n", "<leader>lg", function()
  require("logsitter").log()
end)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
