return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local command_resolver = require("null-ls.helpers.command_resolver")

      null_ls.setup {
        debug = true,
        sources = {
          -- JS
          formatting.prettier.with({
            dynamic_command = command_resolver.from_node_modules(),
          }),
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
