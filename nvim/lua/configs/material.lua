local M = {}

function M.config()
  local status_ok, material = pcall(require, "material")
  if not status_ok then
    return
  end

  material.setup({
    contrast = {
      sidebars = true,
      cursor_line = true,
    },
    italics = {
      comments = true,
      functions = true,
    },
    contrast_filetypes = {
      "terminal",
      "packer",
      "qf",
    },
    high_visibility = {
      lighter = true,
      darker = true
    },
    disable = {
      borders = true,
      eob_lines = true
    },
    lualine_style = 'stealth'
  })

  vim.cmd "colorscheme material"
end

return M
