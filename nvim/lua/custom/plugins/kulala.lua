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
  },
}
