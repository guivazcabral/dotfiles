return {
  'willothy/veil.nvim',
  dependencies = {
    -- All optional, only required for the default setup.
    -- If you customize your config, these aren't necessary.
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim"
  },
  config = function()
    local builtin = require("veil.builtin")
    local current_day = os.date("%A")

    local options = {
      sections = {
        builtin.sections.animated(builtin.headers.frames_days_of_week[current_day], {
          hl = { fg = "#fab387" },
        }),
        builtin.sections.buttons({
          {
            icon = "",
            text = "Find Files",
            shortcut = "f",
            callback = function()
              require("telescope.builtin").find_files()
            end,
          },
          {
            icon = "",
            text = "Find Word",
            shortcut = "w",
            callback = function()
              require("telescope.builtin").live_grep()
            end,
          },
          {
            icon = "",
            text = "Buffers",
            shortcut = "b",
            callback = function()
              require("telescope.builtin").buffers()
            end,
          },
        }),
      },
      mappings = {},
      startup = true,
      listed = false
    }

    require("veil").setup(options)
  end,
}
