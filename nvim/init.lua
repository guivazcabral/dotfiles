-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
  },

  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },

  -- Useful plugin to show you pending keybinds.
  { "folke/which-key.nvim", opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        vim.keymap.set("n", "<leader>gp", require("gitsigns").prev_hunk, { buffer = bufnr, desc = "[G]o to [P]revious Hunk" })
        vim.keymap.set("n", "<leader>gn", require("gitsigns").next_hunk, { buffer = bufnr, desc = "[G]o to [N]ext Hunk" })
        vim.keymap.set("n", "<leader>ph", require("gitsigns").preview_hunk, { buffer = bufnr, desc = "[P]review [H]unk" })
      end,
    },
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {"nvim-lua/plenary.nvim", "Myzel394/jsonfly.nvim", "BurntSushi/ripgrep", "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>j",
        "<cmd>Telescope jsonfly<cr>",
        desc = "Open json(fly)",
        ft = { "json" },
        mode = "n",
      },
    },
    opts = {
      defaults = {
        devicons = true,
      },
    },
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  { "nvim-treesitter/nvim-treesitter-context", opts = {} },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
  { import = "custom.plugins" },
}, {})

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles, { desc = "[F]ind recently [o]pened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fs", require("telescope.builtin").grep_string, { desc = "[F]ind by [S]tring" })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Register custom parsers (must run before TSUpdate / install)
vim.api.nvim_create_autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    require("nvim-treesitter.parsers").blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
      },
    }
  end,
})
vim.treesitter.language.register("blade", "blade")

require("nvim-treesitter").install({
  "html",
  "javascript",
  "typescript",
  "tsx",
  "vimdoc",
  "vim",
  "json",
  "lua",
})

-- Enable highlighting + indent for any filetype with a parser
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if pcall(vim.treesitter.start, args.buf) then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- Textobjects (select, move, swap)
require("nvim-treesitter-textobjects").setup({
  select = { lookahead = true },
  move = { set_jumps = true },
})

local ts_select = require("nvim-treesitter-textobjects.select")
local ts_move = require("nvim-treesitter-textobjects.move")
local ts_swap = require("nvim-treesitter-textobjects.swap")

for _, mode in ipairs({ "x", "o" }) do
  vim.keymap.set(mode, "aa", function() ts_select.select_textobject("@parameter.outer", "textobjects", mode) end)
  vim.keymap.set(mode, "ia", function() ts_select.select_textobject("@parameter.inner", "textobjects", mode) end)
  vim.keymap.set(mode, "af", function() ts_select.select_textobject("@function.outer", "textobjects", mode) end)
  vim.keymap.set(mode, "if", function() ts_select.select_textobject("@function.inner", "textobjects", mode) end)
  vim.keymap.set(mode, "ac", function() ts_select.select_textobject("@class.outer", "textobjects", mode) end)
  vim.keymap.set(mode, "ic", function() ts_select.select_textobject("@class.inner", "textobjects", mode) end)
end

vim.keymap.set({ "n", "x", "o" }, "]m", function() ts_move.goto_next_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]]", function() ts_move.goto_next_start("@class.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]M", function() ts_move.goto_next_end("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "][", function() ts_move.goto_next_end("@class.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[m", function() ts_move.goto_previous_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[[", function() ts_move.goto_previous_start("@class.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[M", function() ts_move.goto_previous_end("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[]", function() ts_move.goto_previous_end("@class.outer", "textobjects") end)

vim.keymap.set("n", "<leader>a", function() ts_swap.swap_next("@parameter.inner") end, { desc = "Swap next parameter" })
vim.keymap.set("n", "<leader>A", function() ts_swap.swap_previous("@parameter.inner") end, { desc = "Swap previous parameter" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- LSP settings.
-- This function gets run when an LSP connects to a particular buffer.
-- Create a command to send messages output to a file
-- This is useful for debugging purposes
vim.api.nvim_create_user_command("EnableRedir", function()
  vim.cmd("redir! >> " .. vim.fn.expand("~/.cache/nvim/nvim.log"))
end, {})

local js_inlay_hints = {
  includeInlayEnumMemberValueHints = false,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayFunctionParameterTypeHints = false,
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayVariableTypeHints = true,
}

-- Setup neovim lua configuration
require("neodev").setup()

-- Per-server config via the new vim.lsp.config API
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.config("ts_ls", {
  settings = {
    javascript = { inlayHints = js_inlay_hints },
    typescript = { inlayHints = js_inlay_hints },
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      hint = { enable = true },
      telemetry = { enable = false },
    },
  },
})

-- Setup mason and let mason-lspconfig auto-enable installed servers
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "lua_ls" },
  automatic_enable = true,
})

-- Single LspAttach handler for keymaps and per-buffer setup
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end
    local bufnr = args.buf

    if client.name == "lua_ls" then
      client.server_capabilities.documentFormattingProvider = false
    end

    local nmap = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. (desc or "") })
    end

    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    nmap("<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")

    if vim.lsp.inlay_hint then
      vim.keymap.set("n", "<leader>uh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
      end, { buffer = bufnr, desc = "Toggle Inlay Hints" })
    end

    if client.name == "ts_ls" then
      vim.api.nvim_buf_create_user_command(bufnr, "OrganizeImports", function()
        client:exec_cmd({
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(bufnr) },
        }, { bufnr = bufnr })
      end, { desc = "Organize Imports" })
      nmap("<leader>o", "<CMD>OrganizeImports<CR>", "[O]rganize Imports")
    end

    if client.name == "eslint" then
      nmap("<leader>f", function()
        require("conform").format({ async = true })
        client:request("workspace/executeCommand", {
          command = "eslint.applyAllFixes",
          arguments = {
            { uri = vim.uri_from_bufnr(bufnr) },
          },
        }, nil, bufnr)
      end, "[F]ix all")
    else
      nmap("<leader>f", function()
        require("conform").format({ async = true })
      end, "[F]ix all")
    end
  end,
})

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

luasnip.config.setup({})

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

-- require("luasnip.loaders.from_vscode").lazy_load()

require("after.plugins.autocmds")
require("after.plugins.mappings")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
