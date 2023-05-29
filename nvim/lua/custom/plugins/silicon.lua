return {
  "narutoxy/silicon.lua",
  dependencies = { "nvim-lua/plenary.nvim" },
  commit = "3223d26456f728870cacab91662d03bbace6e354",
  config = function()
    require("silicon").setup(
      {
        theme = "auto",
        output = "SILICON_${year}-${month}-${date}_${time}.png",   -- auto generate file name based on time (absolute or relative to cwd)
        bgColor = vim.g.terminal_color_5,
        bgImage = "",                                              -- path to image, must be png
        roundCorner = true,
        windowControls = true,
        lineNumber = true,
        font = "FiraCode Nerd Font Mono",
        lineOffset = 1,   -- from where to start line number
        linePad = 2,      -- padding between lines
        padHoriz = 80,    -- Horizontal padding
        padVert = 100,    -- vertical padding
        shadowBlurRadius = 10,
        shadowColor = "#555555",
        shadowOffsetX = 8,
        shadowOffsetY = 8,
        gobble = false,   -- enable lsautogobble like feature
        debug = false,    -- enable debug output
      }
    )
  end

}
