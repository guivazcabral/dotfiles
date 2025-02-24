local function isGitRepo()
  local stat = vim.loop.fs_stat(".git")
  return (stat and stat.type) or false
end

return {
  {
    "echasnovski/mini.notify",
    opts = {},
  },
  {
    "echasnovski/mini.starter",
    version = "*",
    config = function()
      local starter = require("mini.starter")
      local items = {}

      if isGitRepo() then
        local sessions = starter.sections.sessions(2, true)
        if sessions then
          table.insert(items, sessions)
        end
      end

      local recent_files = starter.sections.recent_files(5, true, false)

      if recent_files then
        table.insert(items, recent_files)
      end

      -- since we disable mini sessions for non-git repos, adding the sessions section on the
      -- starter throws an error, so we disable it in that case too
      starter.setup({
        autoopen = true,
        items = items,
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.aligning("center", "center"),
        },
      })
    end,
  },
  {
    "echasnovski/mini.sessions",
    version = "*",
    config = function()
      if not isGitRepo() then
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
          local buffer_file_type = vim.api.nvim_buf_get_option(buffer_number, "filetype")

          if buffer_type == "nofile" or buffer_file_type == "norg" then
            vim.api.nvim_buf_delete(buffer_number, { force = true })
          end
        end
      end

      local count_open_file_buffers = function()
        local count = 0
        for _, buffer_number in pairs(vim.api.nvim_list_bufs()) do
          local buffer_name = vim.api.nvim_buf_get_name(buffer_number)
          local buffer_file_type = vim.api.nvim_buf_get_option(buffer_number, "filetype")

          local ignore_buf_types = { "nofile", "help", "quickfix", "norg", "neo-tree" }

          if buffer_name ~= "" and buffer_file_type ~= "" and not vim.tbl_contains(ignore_buf_types, buffer_file_type) then
            count = count + 1
          end
        end
        return count
      end

      local directory = vim.fn.expand("$HOME") .. "/.cache/nvim/sessions/" .. project_folder_name .. "/"

      local minisessions = require("mini.sessions")
      minisessions.setup({
        autoread = false,
        autowrite = true,
        directory = directory,
        file = "",
        force = { read = false, write = true, delete = false },
        hooks = {
          pre = { read = nil, write = close_bad_buffers, delete = nil },
          post = { read = nil, write = nil, delete = nil },
        },
        verbose = { read = false, write = true, delete = true },
      })

      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          close_bad_buffers()
          local number_of_open_buffers = count_open_file_buffers()
          if number_of_open_buffers > 0 then
            minisessions.write(project_folder_name .. ".vim")
          end
        end,
      })
    end,
  },
}
