local M = {}

function M.config()
  local status_ok, logsitter = pcall(require, "logsitter")
  if not status_ok then
    return
  end

  vim.api.nvim_create_augroup("LogSitter", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    group = "Logsitter",
    pattern = "javascript,go,lua"
  })

end

return M
