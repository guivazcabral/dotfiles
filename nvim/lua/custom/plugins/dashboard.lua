return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  config = function()
    require("dashboard").setup {
      theme = "doom",
      config = {
        header = {
          '        ████████████████████        ',
          '      ██                    ██      ',
          '    ██                        ██    ',
          '  ██                            ██  ',
          '  ██                            ██  ',
          '████████████████████████████████████',
          '██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██',
          '  ████████████████████████████████  ',
          '██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██',
          '  ██░░██░░░░██████░░░░░░██░░░░████  ',
          '  ████  ████      ██████  ████  ██  ',
          '  ██                            ██  ',
          '    ████████████████████████████    ',
          '                                    ',
        },
        center = {
          {
            icon = '  ',
            desc = 'Find file                             ',
            action = 'Telescope find_files',
            shortcut = 'SPC f f'
          },
          {
            icon = '  ',
            desc = 'Find Word                             ',
            action = 'Telescope live_grep',
            keymap = 'SPC f g'
          },
        },
      } }
  end,
}
