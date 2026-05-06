return {
  "moll/vim-bbye",
  "tpope/vim-surround",
  "tpope/vim-abolish",
  "kdheepak/lazygit.nvim",
  "gaelph/logsitter.nvim",
  { "windwp/nvim-ts-autotag", opts = {} },
  { "catgoose/nvim-colorizer.lua", opts = {} },
  { "akinsho/toggleterm.nvim", opts = {} },
  { "rmagatti/alternate-toggler", opts = {} },
  "sudoerwx/vim-ray-so-beautiful",
  {
    "dmmulroy/ts-error-translator.nvim",
    opts = {
      auto_attach = true,
      servers = { "ts_ls" },
    },
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = true,
  },
}
