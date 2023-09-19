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
  "davidgranstrom/nvim-markdown-preview",
  { "rmagatti/alternate-toggler", opts = {} },
  "sudoerwx/vim-ray-so-beautiful",
  {
    "chrisgrieser/nvim-puppeteer",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
  },
}
