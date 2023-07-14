return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")

      require("catppuccin").setup({
        integrations = {
          cmp = true,
          gitsigns = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
          },
          mason = true,
          mini = true,
          neotest = true,
          neotree = true,
          neogit = true,
          rainbow_delimiters = true,
          telescope = { enabled = true },
          which_key = true,
        },
      })
    end,
  },
}
