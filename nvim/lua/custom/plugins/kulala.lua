return {
  "mistweaverco/kulala.nvim",
  lazy = true,
  keys = {
    {
      "<leader>kr",
      function()
        require("kulala").run()
      end,
      desc = "Run Request",
    },
    {
      "<leader>k]",
      function()
        require("kulala").jump_next()
      end,
      desc = "Jump next request",
    },
    {
      "<leader>k[",
      function()
        require("kulala").jump_prev()
      end,
      desc = "Jump previous request",
    },
  },
}
