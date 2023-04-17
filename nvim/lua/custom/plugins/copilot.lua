return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require('copilot').setup({
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
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v18.10.0/bin/node", -- Node.js version must be > 16.x
      server_opts_overrides = {},
    })
  end,
}
