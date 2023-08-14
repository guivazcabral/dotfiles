local map = function(mode, keys, func, desc)
  local opts = { noremap = true, silent = true }

  if desc then
    opts.desc = desc
  end

  vim.keymap.set(mode, keys, func, opts)
end

-- Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
map("n", "<leader>f", "<CMD>lua vim.lsp.buf.format({ async = true })<CR>", "Format current buffer with LSP")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Close buffer
map("n", "Q", "<cmd>Bdelete!<CR>", "Close buffer")
map("n", "<C-w>q", "<cmd>%bd|e#|bd#<CR>", "Close all but current buffer") -- Close all but current buffer

-- Split windows
map("n", "vv", "<C-w>v", "Split vertically")
map("n", "ss", "<C-w>s", "Split horizontally")

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", "Clear search highlight")

-- Disabling arrow keys
map("n", "<Left>", ":echoe 'Use h'<CR>")
map("n", "<Right>", ":echoe 'Use l'<CR>")
map("n", "<Up>", ":echoe 'Use k'<CR>")
map("n", "<Down>", ":echoe 'Use j'<CR>")

-- Replace to better go to the beginning of the line
map("n", "0", "^")
map("n", "^", "0")

-- Copy filepath
map("n", "<leader>cs", ":let @+=fnamemodify(expand('%'), ':~:.')<CR>", "Copy file path")

-- Resize with arrows
map("n", "<C-Up>", "<cmd>resize -2<CR>", "- Horizontal")
map("n", "<C-Down>", "<cmd>resize +2<CR>", "+ Horizontal")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", "- Vertical")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", "+ Vertical")

-- Navigate buffers
map("n", "<S-l>", "<cmd>bnext<CR>")
map("n", "<S-h>", "<cmd>bprevious<CR>")
map("n", "<leader>,", "<cmd>b#<CR>", "Return to previous buffer")

-- NeoTree
map("n", "<leader>ee", "<cmd>Neotree reveal toggle<CR>", "Toggle NeoTree")
map("n", "<leader>e", "<cmd>Neotree reveal<CR>", "Focus NeoTree")

-- Gitsigns
map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", "Git Reset whole file")
map("n", "<leader>hH", "<cmd>Gitsigns reset_hunk<CR>", "Git Reset hunk")
map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", "Git toggle blame")
map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>", "Git toggle deleted")

-- LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", "Lazygit")

-- Neogit
map("n", "<leader>ng", "<cmd>Neogit<CR>", "Neogit")

-- LSPSaga
map("n", "<M-CR>", "<cmd>Lspsaga code_action<cr>", "Code actions")
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", "Show line diagnostics")
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Show hover docs")
map("n", "<leader>gR", "<cmd>Lspsaga finder<CR>", "Find references")

-- Open diagnostics
map("n", "<C-p>", "<cmd>TroubleToggle<CR>", "Open trouble pane")

-- Json Path
map("n", "<leader>jp", "<cmd>JsonPath<CR>", "Copy JSON Path")

-- Run tests
map("n", "<leader>tt", "<cmd>lua require('neotest').run.run()<CR>", "Run tests")
map("n", "<leader>ts", "<cmd>lua require('neotest').summary.open()<CR>", "Open test summary")

-- Logsitter
map("n", "<leader>lg", "<cmd>lua require('logsitter').log()<CR>", "Console log")

-- Neorg
map("n", "<leader>no", "<cmd>Neorg index<CR>", "Neorg")
map("n", "<leader>nt", "<cmd>Neorg toggle-concealer<CR>", "Neorg toggle concealer")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")
