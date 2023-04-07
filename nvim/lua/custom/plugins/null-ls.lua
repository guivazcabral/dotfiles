return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      null_ls.setup {
        debug = true,
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
  }
}
