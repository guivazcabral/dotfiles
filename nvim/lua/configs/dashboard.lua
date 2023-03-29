local M = {}

function M.config()
  local db = require('dashboard')
  local g = vim.g
  local fn = vim.fn

  local plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

  g.dashboard_custom_footer = {
    " ",
    " Neovim loaded " .. plugins_count .. " plugins ",
  }

  g.indentLine_fileTypeExclude = { "dashboard" }


  db.setup({
    theme = 'doom',
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
        { icon = '  ',
          desc = 'Recently opened files                 ',
          action = 'Telescope oldfiles',
          keymap = 'SPC f h'
        },
        { icon = '  ',
          desc = 'Find file                             ',
          action = 'Telescope find_files',
          shortcut = 'SPC f f'
        },
        { icon = '  ',
          desc = 'File Browser                          ',
          action = 'NvimTreeToggle',
          keymap = 'SPC e e'
        },
        { icon = '  ',
          desc = 'Find Word                             ',
          action = 'Telescope live_grep',
          keymap = 'SPC f g'
        },
        { icon = '洛 ',
          desc = 'New File                              ',
          action = 'DashboardNewFile',
          keymap = 'SPC f n'
        },
      },
      footer = {
        " ",
        " Neovim loaded " .. plugins_count .. " plugins ",
      }

    }
  })
end

return M
