
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

-- Split windows
map("n", "vv", "<C-w>v", opts)
map("n", "ss", "<C-w>s", opts)

-- Gitsigns
map("n", "<leader>j", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
map("n", "<leader>k", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
-- Actions
map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", opts)
map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", opts)
map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", opts)
map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", opts)
map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', opts)
map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", opts)
map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>', opts)
map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>", opts)

-- Neogit
map("n", "<leader>gt", "<cmd>Neogit<CR>", opts)

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
map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", opts)

-- Dashboard
map("n", "<leader>fn", "<cmd>DashboardNewFile<CR>", opts)
map("n", "<leader>db", "<cmd>Dashboard<CR>", opts)
map("n", "<leader>bm", "<cmd>DashboardJumpMarks<CR>", opts)
map("n", "<leader>sl", "<cmd>SessionLoad<CR>", opts)

-- Telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", opts)
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
map("n", "<leader>fr", "<cmd>Telescope registers<CR>", opts)

-- Json Path
map("n", "<leader>jp", "<cmd>JsonPath<CR>", opts)

-- Logsitter this is so hacky it hurts
vim.keymap.set("n", "<leader>lg", function()
  require("logsitter").log()
end)

-- Lspsaga
map("n", "<M-CR>", "<cmd>Lspsaga code_action<cr>", opts)
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opts)
map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opts)

-- Comment
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
map("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)

-- Terminal
map("n", "<C-\\>", "<cmd>ToggleTerm<CR>", opts)

-- Markdown Preview
map("n", "<leader>mp", "<Plug>MarkdownPreview", opts)

-- Cheatsheet
map("n", "<leader>?", "<Cmd>Cheatsheet<CR>", opts)

-- Outline
map("n", "<C-7>", "<Cmd>SymbolsOutline<CR>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<A-j>", "<cmd>m .+1<CR>==", opts)
map("v", "<A-k>", "<cmd>m .-2<CR>==", opts)
map("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
map("x", "J", "<cmd>move '>+1<CR>gv-gv", opts)
map("x", "K", "<cmd>move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", "<cmd>move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", "<cmd>move '<-2<CR>gv-gv", opts)

-- Run tests
map("n", "<leader>t", "<cmd>lua require('jester').run_file()<CR>", opts)

return M
