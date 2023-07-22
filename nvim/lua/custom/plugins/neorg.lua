return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        }, -- Loads completion module
        ["core.keybinds"] = {}, -- Module for managing keybindings with Neorg mode support
        ["core.itero"] = {}, -- Module for managing keybindings with Neorg mode support
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              work = "~/dev/datacamp/notes",
              home = "~/notes",
            },
          },
        },
      },
    })
  end,
}
