return {
  "moll/vim-bbye",
  "tpope/vim-surround",
  "tpope/vim-abolish",
  "karb94/neoscroll.nvim",
  "p00f/nvim-ts-rainbow",
  "windwp/nvim-ts-autotag",
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
