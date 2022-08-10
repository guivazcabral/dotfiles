local M = {}

function M.config()
  -- Formatting and linting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    return
  end

  -- Check supported formatters
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting

  -- Check supported linters
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      -- Elixir
      formatting.mix,
      -- JS
      formatting.prettier,
      -- Fish
      formatting.fish_indent,
      -- Go
      diagnostics.golangci_lint,
      formatting.gofmt,
      formatting.goimports,
      -- Ruby
      formatting.rubocop,
      diagnostics.rubocop,
    },
  }
end

return M
