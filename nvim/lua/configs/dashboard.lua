local M = {}

function M.config()
  local db = require('dashboard')
  db.custom_header = {
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
  }

  db.preview_file_height = 12
  db.preview_file_width = 80
  db.custom_center = {
    { icon = '  ',
      desc = 'Recently opened files                 ',
      action = 'Telescope oldfiles',
      shortcut = 'SPC f h'
    },
    { icon = '  ',
      desc = 'Find file                             ',
      action = 'Telescope find_files',
      shortcut = 'SPC f f'
    },
    { icon = '  ',
      desc = 'File Browser                          ',
      action = 'NvimTreeToggle',
      shortcut = 'SPC e e'
    },
    { icon = '  ',
      desc = 'Find Word                             ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f g'
    },
    { icon = '洛 ',
      desc = 'New File                              ',
      action = 'DashboardNewFile',
      shortcut = 'SPC f n'
    },
  }

  local g = vim.g
  local fn = vim.fn

  local plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

  g.dashboard_custom_footer = {
    " ",
    " Neovim loaded " .. plugins_count .. " plugins ",
  }

  g.indentLine_fileTypeExclude = { "dashboard" }
end

return M
