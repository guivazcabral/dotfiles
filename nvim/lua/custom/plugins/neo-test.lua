return {
  "nvim-neotest/neotest",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-jest"
  },
  config = function()
    require("neotest").setup({
      output = {
        enabled = true,
        open_on_run = "short"
      },
      adapters = {
        require('neotest-jest')({
          jestCommand = "npm test --",
        }),
      }
    })
  end
}
