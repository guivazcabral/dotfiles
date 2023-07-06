return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local icons = require("nvim-web-devicons")

    local colors = {
      angular = "#c3002f",
      c = "#519aba",
      css = "#61afef",
      deb = "#a1b7ee",
      docker = "#384d54",
      html = "#de8c92",
      js = "#ebcb8b",
      kt = "#7bc99c",
      lock = "#c4c720",
      lua = "#51a0cf",
      out = "#abb2bf",
      py = "#a3b8ef",
      robot = "#abb2bf",
      toml = "#39bf39",
      ts = "#519aba",
      ttf = "#abb2bf",
      rb = "#ff75a0",
      rpm = "#fca2aa",
      woff = "#abb2bf",
      woff2 = "#abb2bf",
      zip = "#f9d71c",
      jsx = "#519ab8",
      vue = "#7bc99c",
      rs = "#dea584",
      png = "#c882e7",
      jpeg = "#c882e7",
      jpg = "#c882e7",
    }

    icons.set_icon {
      css = {
        icon = "",
        color = colors.css,
        name = "css",
      },
      Dockerfile = {
        icon = "",
        color = colors.docker,
        name = "Dockerfile",
      },
      html = {
        icon = "",
        color = colors.html,
        name = "html",
      },
      js = {
        icon = "",
        color = colors.js,
        name = "js",
      },
      lua = {
        icon = "",
        color = colors.lua,
        name = "lua",
      },
      py = {
        icon = "",
        color = colors.py,
        name = "py",
      },
      toml = {
        icon = "",
        color = colors.toml,
        name = "toml",
      },
      ["module.ts"] = {
        icon = "",
        color = colors.angular,
        name = "angular",
      },
      ["stories.ts"] = {
        icon = "",
        color = colors.rb,
        name = "storybook",
      },
      ["stories.tsx"] = {
        icon = "",
        color = colors.rb,
        name = "storybookreact",
      },
      ["spec.ts"] = {
        icon = "",
        color = colors.ts,
        name = "specTs",
      },
      ["cy.ts"] = {
        icon = "󰙨",
        color = colors.ts,
        name = "cypress",
      },
      ts = {
        icon = "",
        color = colors.ts,
        name = "ts",
      },
      ttf = {
        icon = "",
        color = colors.ttf,
        name = "TrueTypeFont",
      },
      tsx = {
        icon = "",
        color = colors.jsx,
        name = "jsx",
      },
      jsx = {
        icon = "",
        color = colors.jsx,
        name = "jsx",
      },
    }
  end
}
