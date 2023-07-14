return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local copilot_indicator = function()
      local client = vim.lsp.get_active_clients({ name = "copilot" })[1]
      if client == nil then
        return ""
      end

      if vim.tbl_isempty(client.requests) then
        return "" -- default icon whilst copilot is idle
      end

      local spinners = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
      local ms = vim.loop.hrtime() / 1000000
      local frame = math.floor(ms / 120) % #spinners

      return spinners[frame + 1]
    end

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "neo-tree", "veil" },
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "filename" },
        lualine_c = { "diff", "diagnostics" },
        lualine_x = { copilot_indicator },
        lualine_y = { "filetype" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
