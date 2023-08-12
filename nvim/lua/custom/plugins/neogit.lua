return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  config = function()
    local neogit = require("neogit")

    neogit.setup({
      use_telescope = true,
      kind = "vsplit",
      integrations = {
        diffview = true,
      },
      disable_insert_on_commit = "auto",
      disable_commit_confirmation = true,
    })

    local group = vim.api.nvim_create_augroup("MyCustomNeogitEvents", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      pattern = "NeogitPushComplete",
      group = group,
      callback = function()
        neogit.close()
      end,
    })
  end,
}
