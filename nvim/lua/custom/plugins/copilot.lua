return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 100,
          keymap = {
            accept = "<M-CR>",
            accept_word = false,
            accept_line = false,
            next = "<M-Down>",
            prev = "<M-Up>",
            dismiss = "<C-c>",
          },
        },
        filetypes = {
          ["."] = false,
          norg = false,
          cvs = false,
          gitcommit = false,
          gitrebase = false,
          help = false,
          hgcommit = false,
          markdown = false,
          svn = false,
          yaml = false,
        },
        copilot_node_command = "/Users/guilherme/Library/Application Support/fnm/node-versions/v18.16.0/installation/bin/node",
        server_opts_overrides = {},
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
      language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
  },
}
