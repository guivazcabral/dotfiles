return {
  -- Add indentation guides even on blank lines
  "lukas-reineke/indent-blankline.nvim",
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  main = "ibl",
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }
    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes

    local theme_colors = require("catppuccin.palettes").get_palette("mocha")

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = theme_colors.peach })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = theme_colors.yellow })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = theme_colors.blue })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = theme_colors.pink })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = theme_colors.green })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = theme_colors.lavender })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = theme_colors.teal })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }
    require("ibl").setup({ scope = { highlight = highlight, enabled = true } })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
