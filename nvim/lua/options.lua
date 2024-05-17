vim.o.backup = false
vim.o.breakindent = true -- Disable making a backup file
vim.o.clipboard = "unnamedplus" -- Connection to the system clipboard
vim.o.cmdheight = 1 -- Number of screen lines to use for the command line
vim.o.colorcolumn = "99999" -- Fix for the indentline problem
vim.o.completeopt = "menuone,noselect" -- Options for insert mode completion
vim.o.conceallevel = 0 -- Do not conceal chars
vim.o.cursorline = true -- Highlight the text line of the cursor
vim.o.expandtab = true -- Enable the use of space in tab
vim.o.fileencoding = "utf-8" -- File content encoding for the buffer
vim.o.foldcolumn = "1" -- Show fold markers on the left of line numbers
vim.o.foldmethod = "manual" -- Create folds manually
vim.o.hidden = true -- Ignore unsaved buffers
vim.o.history = 100 -- Number of commands to remember in a history table
vim.o.hlsearch = true -- Highlight all the matches of search pattern
vim.o.ignorecase = true -- Case insensitive searching
vim.o.mouse = "" -- Disable default mouse vim.otings from nvim 0.8
vim.o.number = true -- Show numberline
vim.o.list = true -- Enable lists
vim.o.listchars = "tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○" -- Set listchars for tabs, trailing spaces, etc
vim.o.pumheight = 10 -- Height of the pop up menu
vim.o.relativenumber = true -- Show relative numberline
vim.o.scrolloff = 8 -- Number of lines to keep above and below the cursor
vim.o.shiftwidth = 2 -- Number of space inserted for indentation
vim.o.showmode = true -- Disable showing modes in command line
vim.o.sidescrolloff = 8 -- Number of columns to keep at the sides of the cursor
vim.o.smartcase = true -- Case sensitivie searching
vim.o.smartindent = true -- Do auto indenting when starting a new line
vim.o.spell = false -- Disable spelling checking and highlighting
vim.o.spelllang = "en" -- Support US english
vim.o.splitbelow = true -- Splitting a new window below the current one
vim.o.splitright = true -- Splitting a new window at the right of the current one
vim.o.swapfile = false -- Disable use of swapfile for the buffer
vim.o.tabstop = 2 -- Number of space in a tab
vim.o.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.o.textwidth = 99
vim.o.timeout = true
vim.o.timeoutlen = 300 -- Length of time to wait for a mapped sequence
vim.o.undofile = true -- Enable persistent undo
vim.o.updatetime = 250 -- Length of time to wait before triggering the plugin
vim.o.wrap = false -- Disable wrapping of lines longer than the width of window
vim.o.writebackup = false -- Disable making a backup before overwriting a file
vim.wo.signcolumn = "yes" -- Always show the sign column
