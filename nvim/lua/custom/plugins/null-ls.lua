return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
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

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup {
        debug = false,
        sources = {
          -- JS
          formatting.prettierd,
          -- Fish
          formatting.fish_indent,
          -- Terraform
          formatting.terraform_fmt,
          -- Json
          diagnostics.jsonlint,
        },
      }
    end
  } -- configure formatters & linters
}
