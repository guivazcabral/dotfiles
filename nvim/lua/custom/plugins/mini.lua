return {
  {
    "echasnovski/mini.starter",
    version = "false",
    config = function()
      local starter = require('mini.starter')
      starter.setup({
        items = {
          starter.sections.sessions(2, true),
          starter.sections.recent_files(5, true, false),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.aligning('center', 'center'),
        },
      })
    end
  },
  {
    "echasnovski/mini.sessions",
    version = "false",
    config = function()
      local cwd = vim.fn.getcwd()
      local project_folder_name = cwd:match("^.+/(.+)$")

      local close_bad_buffers = function()
        local buffer_numbers = vim.api.nvim_list_bufs()
        for _, buffer_number in pairs(buffer_numbers) do
          local buffer_type = vim.api.nvim_buf_get_option(buffer_number, "buftype")
          if buffer_type == "nofile" then
            vim.api.nvim_buf_delete(buffer_number, { force = true })
          end
        end
      end

      local minisessions = require("mini.sessions")
      minisessions.setup({
        -- Whether to read latest session if Neovim opened without file arguments
        autoread = false,
        autowrite = true,
        directory = vim.fn.expand("$HOME") .. "/.cache/nvim/sessions/" .. project_folder_name .. "/",
        file = '',
        force = { read = false, write = true, delete = false },
        hooks = {
          pre = { read = nil, write = close_bad_buffers, delete = nil },
          post = { read = nil, write = nil, delete = nil },
        },
        verbose = { read = false, write = true, delete = true },
      })

      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          minisessions.write(project_folder_name .. ".vim")
        end
      })
    end
  },
}
