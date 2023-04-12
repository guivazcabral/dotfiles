return {
  'EricDriussi/remember-me.nvim',
  config = function()
    local remember_me = require("remember_me")
    remember_me.setup({
      ignore_ft = { "man", "gitignore", "gitcommit" },
      session_store = "~/.cache/remember-me/",
      project_roots = { ".git", ".svn" },
    })
  end
}
