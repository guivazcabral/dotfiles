return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "jose-elias-alvarez/typescript.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      sources = {
        -- JS
        diagnostics.eslint_d,
        formatting.eslint_d,
        formatting.prettierd,
        -- Fish
        formatting.fish_indent,
        -- Lua
        formatting.stylua,
        -- Terraform
        formatting.terraform_fmt,
        code_actions.gitrebase,
      },
    })
  end,
}
