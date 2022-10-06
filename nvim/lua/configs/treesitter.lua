local M = {}

function M.config()
  local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  treesitter.setup {
    ensure_installed = {
      "ruby",
      "typescript",
      "tsx",
      "json",
      "yaml",
      "html",
      "scss",
      "lua",
      "bash",
      "fish",
      "go",
      "elixir"
    },
    sync_install = false,
    ignore_install = {},
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    autopairs = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    rainbow = {
      enable = true,
      disable = { "html" },
      extended_mode = false,
      max_file_lines = nil,
    },
    autotag = {
      enable = true,
    },
    matchup = {
      enable = true,
    },
  }

  local status_ok, treesitter_context = pcall(require, "treesitter-context")
  if not status_ok then
    return
  end

  treesitter_context.setup({})
end

return M
