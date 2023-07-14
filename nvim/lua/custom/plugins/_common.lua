return {
  "moll/vim-bbye",
  "tpope/vim-surround",
  "tpope/vim-abolish",
  "stevearc/dressing.nvim",
  "kdheepak/lazygit.nvim",
  "gaelph/logsitter.nvim",
  { "windwp/nvim-ts-autotag", opts = {} },
  { "norcalli/nvim-colorizer.lua", opts = {} },
  { "akinsho/toggleterm.nvim", opts = {} },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
  },
}
