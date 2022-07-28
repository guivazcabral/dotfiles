local M = {}

function M.config()
  local status_ok, nvimtree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end

  local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if not config_status_ok then
    return
  end

  local g = vim.g
  local tree_cb = nvim_tree_config.nvim_tree_callback

  nvimtree.setup {
    auto_reload_on_write = true,
    filters = {
      dotfiles = false,
      custom = {
        ".git",
        "node_modules",
        ".cache",
      },
    },
    disable_netrw = false,
    hijack_netrw = true,
    ignore_ft_on_setup = {
      "dashboard",
      "startify",
      "alpha",
    },
    ignore_buffer_on_setup = false,
    open_on_tab = false,
    open_on_setup = false,
    open_on_setup_file = false,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    system_open = {
      cmd = "",
      args = {},
    },
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      height = 30,
      hide_root_folder = false,
      mappings = {
        custom_only = false,
        list = {
          { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          { key = "h", cb = tree_cb "close_node" },
          { key = "v", cb = tree_cb "vsplit" },
        },
      },
      number = false,
      preserve_window_proportions = false,
      relativenumber = false,
      side = "left",
      signcolumn = "yes",
      width = 30,
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false,
      },
    },
  }

  g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
    },
    folder = {
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
    },
  }
  g.nvim_tree_indent_markers = 1
end

return M
