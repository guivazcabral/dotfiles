local M = {}

function M.config()
  local present, cheatsheet = pcall(require, "cheatsheet")
  if not present then
    return
  end

  cheatsheet.setup({
    bundled_cheatsheets = { 
      disabled = { "nerd-fonts", "octo" } 
    },
    bundled_plugin_cheatsheets = true,
    include_only_installed_plugins = true,
  })
end

return M
