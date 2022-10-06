local M = {}

function M.config()
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    return
  end

  local colors = require("catppuccin.palettes").get_palette()

  catppuccin.setup {
    transparent_background = false,
    term_colors = false,
    compile = {
      enabled = false,
      path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      treesitter = true,
      treesitter_context = true,
      cmp = true,
      gitsigns = true,
      telescope = true,
      nvimtree = true,
      symbols_outline = true,
      which_key = true
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
    custom_highlights = {
      TreesitterContext = { fg = colors.blue, bg = colors.mantle, style = { "italic", "bold" } },
      TreesitterContextLineNumber = { fg = colors.blue, bg = colors.mantle, style = { "italic", "bold" } },
    },
    color_overrides = {},
    highlight_overrides = {},
  }
end

return M
