local M = {}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local utils = require("lualine.utils.utils")
  local highlight = require("lualine.highlight")

  local diagnostics_message = require("lualine.component"):extend()

  diagnostics_message.default = {
    colors = {
      error = utils.extract_color_from_hllist(
        { "fg", "sp" },
        { "DiagnosticError", "LspDiagnosticsDefaultError", "DiffDelete" },
        "#e32636"
      ),
      warning = utils.extract_color_from_hllist(
        { "fg", "sp" },
        { "DiagnosticWarn", "LspDiagnosticsDefaultWarning", "DiffText" },
        "#ffa500"
      ),
      info = utils.extract_color_from_hllist(
        { "fg", "sp" },
        { "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "DiffChange" },
        "#ffffff"
      ),
      hint = utils.extract_color_from_hllist(
        { "fg", "sp" },
        { "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffAdd" },
        "#273faf"
      ),
    },
  }
  function diagnostics_message:init(options)
    diagnostics_message.super:init(options)
    self.options.colors = vim.tbl_extend("force", diagnostics_message.default.colors, self.options.colors or {})
    self.highlights = { error = "", warn = "", info = "", hint = "" }
    self.highlights.error = highlight.create_component_highlight_group(
      { fg = self.options.colors.error },
      "diagnostics_message_error",
      self.options
    )
    self.highlights.warn = highlight.create_component_highlight_group(
      { fg = self.options.colors.warn },
      "diagnostics_message_warn",
      self.options
    )
    self.highlights.info = highlight.create_component_highlight_group(
      { fg = self.options.colors.info },
      "diagnostics_message_info",
      self.options
    )
    self.highlights.hint = highlight.create_component_highlight_group(
      { fg = self.options.colors.hint },
      "diagnostics_message_hint",
      self.options
    )
  end

  function diagnostics_message:update_status(is_focused)
    local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
    local diagnostics = vim.diagnostic.get(0, { lnum = r - 1 })
    if #diagnostics > 0 then
      local diag = diagnostics[1]
      for _, d in ipairs(diagnostics) do
        if d.severity < diag.severity then
          diagnostics = d
        end
      end
      local icons = { "??? ", "??? ", "??? ", "??? " }
      local hl = { self.highlights.error, self.highlights.warn, self.highlights.info, self.highlights.hint }
      return highlight.component_format_highlight(hl[diag.severity]) .. icons[diag.severity] .. " " .. diag.message
    else
      return ""
    end
  end

  local colors = {
    yellow = "#ecbe7b",
    yellow_1 = "#ff9640",
    grey = "#2c323c",
    white = "#bbc2cf",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67",
  }

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand "%:t") ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand "%:p:h"
      local gitdir = vim.fn.finddir(".git", filepath .. ";")
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  local config = {
    options = {
      disabled_filetypes = { "NvimTree", "dashboard", "Outline" },
      component_separators = "",
      section_separators = "",
      theme = 'catppuccin'
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = { {
        diagnostics_message,
        colors = {
          error = "#BF616A",
          warn = "#EBCB8B",
          info = "#A3BE8C",
          hint = "#88C0D0",
        },
      }, },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }

  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  ins_left {
    function()
      return "???"
    end,
    color = { fg = colors.blue },
    padding = { left = 0, right = 0 },
  }

  ins_left {
    "branch",
    icon = "???",
    color = { fg = colors.violet, gui = "bold" },
    padding = { left = 2, right = 1 },
  }

  ins_left {
    "filetype",
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = "bold" },
    padding = { left = 2, right = 1 },
  }

  ins_left {
    "diff",
    symbols = { added = "??? ", modified = "???", removed = "??? " },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.yellow_1 },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
    padding = { left = 2, right = 1 },
  }

  ins_left {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = "??? ", warn = "??? ", info = "??? ", hint = "??? " },
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.yellow },
      color_info = { fg = colors.cyan },
    },
    padding = { left = 2, right = 1 },
  }

  ins_left {
    "filename",
    file_status = true, -- Displays file status (readonly status, modified status)
    path = 1, -- 0: Just the filename
    -- 1: Relative path
    -- 2: Absolute path

    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
    symbols = {
      modified = '[+]', -- Text to show when the file is modified.
      readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
      unnamed = '[No Name]', -- Text to show for unnamed buffers.
    }
  }

  ins_left {
    function()
      return "%="
    end,
  }

  ins_right {
    function(msg)
      msg = msg or "Inactive"
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients) == nil then
        if type(msg) == "boolean" or #msg == 0 then
          return "Inactive"
        end
        return msg
      end
      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      local formatters = require "core.utils"
      local supported_formatters = formatters.list_registered_formatters(buf_ft)
      vim.list_extend(buf_client_names, supported_formatters)

      local linters = require "core.utils"
      local supported_linters = linters.list_registered_linters(buf_ft)
      vim.list_extend(buf_client_names, supported_linters)

      return table.concat(buf_client_names, ", ")
    end,
    icon = "??? ",
    color = { gui = "none" },
    padding = { left = 0, right = 1 },
    cond = conditions.hide_in_width,
  }

  ins_right {
    function()
      local b = vim.api.nvim_get_current_buf()
      if next(vim.treesitter.highlighter.active[b]) then
        return " ???TS"
      end
      return ""
    end,
    color = { fg = colors.green },
    padding = { left = 1, right = 0 },
    cond = conditions.hide_in_width,
  }

  ins_right {
    "location",
    padding = { left = 1, right = 1 },
  }

  ins_right {
    "progress",
    color = { fg = colors.fg, gui = "none" },
    padding = { left = 0, right = 0 },
  }

  ins_right {
    function()
      local current_line = vim.fn.line "."
      local total_lines = vim.fn.line "$"
      local chars = { "__", "??????", "??????", "??????", "??????", "??????", "??????", "??????", "??????" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end,
    padding = { left = 1, right = 1 },
    color = { fg = colors.yellow, bg = colors.grey },
    cond = nil,
  }

  ins_right {
    function()
      return "???"
    end,
    color = { fg = colors.blue },
    padding = { left = 1, right = 0 },
  }

  lualine.setup(config)
end

return M
