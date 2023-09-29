return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- check if current folder contains "datacamp" or "notes"
    local function is_datacamp()
      local path = vim.fn.expand("%:p:h")
      return string.find(path, "datacamp") ~= nil
    end

    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.summary"] = {}, -- Loads default behaviour
        ["core.export"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
          },
        }, -- Adds pretty icons to your documents
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        }, -- Loads completion module
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              work = "~/dev/datacamp/notes",
              home = "~/dev/personal/notes",
            },
            default_workspace = is_datacamp() and "work" or "home",
          },
        },
      },
    })
  end,
}
