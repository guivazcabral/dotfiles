local M = {}

local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
  return
end

packer.startup {
  function(use)
    -- Plugin manager
    use {
      "wbthomason/packer.nvim",
    }

    -- Optimiser
    use {
      "lewis6991/impatient.nvim",
    }

    -- Lua functions
    use {
      "nvim-lua/plenary.nvim",
    }

    -- Popup API
    use {
      "nvim-lua/popup.nvim",
    }

    -- Multiple cursors
    use {
      "mg979/vim-visual-multi"
    }

    -- Split Join
    use {
      "AndrewRadev/splitjoin.vim"
    }

    -- Comment
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("configs.comment").config()
      end
    }

    -- Boost startup time
    use {
      "nathom/filetype.nvim",
      config = function()
        vim.g.did_load_filetypes = 1
      end,
    }

    -- Cursorhold fix
    use {
      "antoinemadec/FixCursorHold.nvim",
      event = "BufRead",
      config = function()
        vim.g.cursorhold_updatetime = 100
      end,
    }

    -- Icons
    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("configs.icons").config()
      end,
    }

    -- Buffer
    use {
      "akinsho/bufferline.nvim",
      config = function()
        require("configs.bufferline").config()
      end,
      requires = "kyazdani42/nvim-web-devicons"
    }

    use "moll/vim-bbye"

    -- File explorer
    use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function()
        require("configs.nvim-tree").config()
      end
    }

    -- Statusline
    use {
      "nvim-lualine/lualine.nvim",
      config = function()
        require("configs.lualine").config()
      end
    }

    -- Colorscheme
    use {
      "catppuccin/nvim", as = "catppuccin",
      config = function()
        vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
        require("configs.catppuccin").config()
        vim.cmd [[colorscheme catppuccin]]
      end
    }

    -- Syntax highlighting
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      event = "BufRead",
      cmd = {
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
        "TSDisableAll",
        "TSEnableAll",
      },
      config = function()
        require("configs.treesitter").config()
      end,
      requires = {
        {
          -- Parenthesis highlighting
          "p00f/nvim-ts-rainbow",
          after = "nvim-treesitter"
        },
        {
          -- Autoclose tags
          "windwp/nvim-ts-autotag",
          after = "nvim-treesitter"
        },
        {
          -- context sticky headers
          "nvim-treesitter/nvim-treesitter-context",
          after = "nvim-treesitter"
        },
      },
    }

    use {
      "andymass/vim-matchup"
    }

    -- Snippet engine
    use {
      "L3MON4D3/LuaSnip",
      config = function()
        require("luasnip/loaders/from_vscode").lazy_load()
      end,
      requires = {
        -- Snippet collections
        "rafamadriz/friendly-snippets",
      },
    }

    -- Completion engine
    use {
      "hrsh7th/nvim-cmp",
      event = "BufRead",
      config = function()
        require("configs.cmp").config()
      end,
    }

    -- Snippet completion source
    use {
      "saadparwaiz1/cmp_luasnip",
      after = "nvim-cmp",
    }

    -- Buffer completion source
    use {
      "hrsh7th/cmp-buffer",
      after = "nvim-cmp",
    }

    -- Path completion source
    use {
      "hrsh7th/cmp-path",
      after = "nvim-cmp",
    }

    -- LSP completion source
    use {
      "hrsh7th/cmp-nvim-lsp",
    }

    -- LSP manager
    use {
      "williamboman/nvim-lsp-installer",
      event = "BufRead",
      cmd = {
        "LspInstall",
        "LspInstallInfo",
        "LspPrintInstalled",
        "LspRestart",
        "LspStart",
        "LspStop",
        "LspUninstall",
        "LspUninstallAll",
      },
    }

    -- Built-in LSP
    use {
      "neovim/nvim-lspconfig",
      event = "BufRead",
      config = function()
        require "configs.lsp"
      end,
    }

    -- LSP enhancer
    use {
      "tami5/lspsaga.nvim",
      event = "BufRead",
      config = function()
        require("configs.lsp.lspsaga").config()
      end
    }

    -- LSP symbols
    use {
      "simrat39/symbols-outline.nvim",
      setup = function()
        require("configs.symbols-outline").setup()
      end
    }

    -- Fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      config = function()
        require("configs.telescope").config()
      end,
    }

    -- Fuzzy finder syntax support
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    }

    -- Formatting and linting
    use {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("configs.null-ls").config()
      end,
      requires = { "nvim-lua/plenary.nvim" }
    }

    -- Git integration
    use {
      "lewis6991/gitsigns.nvim",
      event = "BufRead",
      config = function()
        require("configs.gitsigns").config()
      end
    }

    use {
      "pwntester/octo.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "kyazdani42/nvim-web-devicons",
      },
      config = function()
        require("configs.octo").config()
      end
    }

    use {
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
      event = "BufRead",
      config = function()
        require("configs.neogit")
      end
    }

    -- Tests
    use {
      "vim-test/vim-test",
      event = "BufRead",
      config = function()
        require("configs.vim-test")
      end
    }

    use {
      "David-Kunz/jester" ,
      config = function()
        require("configs.jester").config()
      end
    }

    -- Rails
    use {
      "tpope/vim-rails",
      event = "BufRead",
      config = function()
        require("configs.vim-rails")
      end
    }

    -- Abolish
    use {
      "tpope/vim-abolish",
      event = "BufRead"
    }

    -- Surround
    use {
      "tpope/vim-surround"
    }

    -- Start screen
    use {
      "glepnir/dashboard-nvim",
      event = 'VimEnter',
      config = function()
        require("configs.dashboard").config()
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
    }

    -- Color highlighting
    use {
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = function()
        require("configs.colorizer").config()
      end
    }

    -- Autopairs
    use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
        require("configs.autopairs").config()
      end,
    }

    -- Terminal
    use {
      "akinsho/nvim-toggleterm.lua",
      cmd = "ToggleTerm",
      config = function()
        require("configs.toggleterm").config()
      end
    }

    -- Indentation
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("configs.indent-line").config()
      end
    }

    -- Keymaps popup
    use {
      "folke/which-key.nvim",
      config = function()
        require("configs.which-key").config()
      end
    }

    -- Preview Markdown
    use {
      "iamcco/markdown-preview.nvim",
      event = "BufRead",
      run = ":call mkdp#util#install()",
    }

    -- Smooth scrolling
    use {
      "karb94/neoscroll.nvim",
      event = "BufRead",
      config = function()
        require("configs.neoscroll").config()
      end
    }

    -- Cheatsheet
    use {
      'sudormrfbin/cheatsheet.nvim',
      requires = {
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
      },
      config = function()
        require("configs.cheatsheet").config()
      end
    }

    -- Copy json path
    use {
      'mogelbrod/vim-jsonpath',
      config = function()
        require("configs.jsonpath").config()
      end
    }

    use {
      'gaelph/logsitter.nvim', 
      requires = {
        'nvim-treesitter/nvim-treesitter'
      }
    }

    use {
      'anuvyklack/pretty-fold.nvim',
      config = function()
        require("configs.pretty-fold").config()
      end
    }

    use {
      'EricDriussi/remember-me.nvim',
      config = function()
        require("configs.remember-me").config()
      end
    }
  end,
  config = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
    profile = {
      enable = true,
      threshold = 0.0001,
    },
    git = {
      clone_timeout = 300,
    },
    auto_clean = true,
    compile_on_sync = true,
  },
}

return M
