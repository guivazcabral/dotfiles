local M = {}

function M.config()
  local status_ok, remember_me = pcall(require, "remember_me")
  if not status_ok then
    return
  end

  remember_me.setup({
    ignore_ft = { "man", "gitignore", "gitcommit" },
    session_store = "~/.cache/remember-me/",
    project_roots = { ".git", ".svn" },
  })
end

return M

