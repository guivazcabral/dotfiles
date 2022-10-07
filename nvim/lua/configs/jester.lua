local M = {}

function M.config()
  local status_ok, jester = pcall(require, "jester")
  if not status_ok then
    return
  end

  jester.setup({
    cmd = "./node_modules/jest/bin/jest.js $file",
  })
end

return M