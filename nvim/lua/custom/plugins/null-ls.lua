return {
  "nvimtools/none-ls.nvim",
  dependencies = { "jose-elias-alvarez/typescript.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    local cwd = vim.fn.getcwd() .. "/node_modules/.bin/eslint"

    null_ls.setup({
      sources = {
        -- JS
        diagnostics.eslint_d.with({
          filter = function(diagnostic)
            return diagnostic.code ~= "prettier/prettier"
          end,
          -- extra_args = { "--eslint-path " .. cwd },
          extra_args = { "--eslint-path " .. cwd },
        }),
        formatting.eslint_d,
        -- formatting.prettierd,
        -- Fish
        formatting.fish_indent,
        -- Lua
        formatting.stylua,
        -- Terraform
        formatting.terraform_fmt,
        code_actions.gitrebase,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({})
            end,
          })
        end
      end,
    })
  end,
}
