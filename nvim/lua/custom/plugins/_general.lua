return {
  "moll/vim-bbye",
  "tpope/vim-surround",
  "tpope/vim-abolish",
  "stevearc/dressing.nvim",
  "kdheepak/lazygit.nvim",
  {
    "phaazon/hop.nvim",
    branch = "v2",
    opts = {}
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup()
    end
  },
  "gaelph/logsitter.nvim",
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    }
  },
}
