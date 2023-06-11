local function isGitRepo()
  local stat = vim.loop.fs_stat(".git")
  return (stat and stat.type) or false
end

return {
  {
    "echasnovski/mini.starter",
    version = "false",
    config = function()
      local starter = require('mini.starter')
      local items = { starter.sections.recent_files(5, true, false) }

      -- since we disable mini sessions for non-git repos, adding the sessions section on the
      -- starter throws an error, so we disable it in that case too
      if (isGitRepo()) then
        table.insert(items, starter.sections.sessions(2, true))
      end

      starter.setup({
        items,
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
      if (not isGitRepo()) then
        return
      end

      local cwd = vim.fn.getcwd()
      local project_folder_name = cwd:match("^.+/(.+)$")

      -- close bad buffers (neo-tree, trouble, etc) to avoid saving them in the session
      -- otherwise, loading the session would open them with the wrong size
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
