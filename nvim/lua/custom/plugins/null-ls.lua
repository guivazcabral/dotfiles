return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local code_actions = null_ls.builtins.code_actions
      local command_resolver = require("null-ls.helpers.command_resolver")

      null_ls.setup {
        sources = {
          -- JS
          diagnostics.eslint,
          formatting.eslint,
          formatting.prettier.with({
            dynamic_command = command_resolver.from_node_modules(),
          }),
          -- Fish
          formatting.fish_indent,
          -- Terraform
          formatting.terraform_fmt,
          code_actions.gitrebase,
        },
      }
    end
  }
}
