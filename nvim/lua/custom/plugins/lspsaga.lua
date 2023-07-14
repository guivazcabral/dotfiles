return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enabled = true,
        virtual_text = false,
      },
      code_action = {
        num_shortcut = true,
        show_server_name = true,
        extend_gitsigns = true,
        keys = {
          quit = "q",
          exec = "<CR>",
        },
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
