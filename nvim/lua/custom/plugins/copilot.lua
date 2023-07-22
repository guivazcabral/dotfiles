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
          enabled = false,
          auto_trigger = false,
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
        copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v18.16.0/bin/node", -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
