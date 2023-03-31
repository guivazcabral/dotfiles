return {
  "moll/vim-bbye",
  "tpope/vim-surround",
  "tpope/vim-abolish",
  "p00f/nvim-ts-rainbow",
  "windwp/nvim-ts-autotag",
  "gaelph/logsitter.nvim",
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {}
    end
  },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    }
  },
}
