if vim.g.vscode then return {} end

---@type LazySpec
return {
  -- the colorscheme should be available when starting Neovim
  {
    "arturgoms/moonbow.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      enable = {
        terminal = true,
        legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
      },
      palette = {
        moon = {
          base = "#18191a",
          surface = "#1c2c4c",
          overlay = "#363738",
        },
      },
    },
  },
}
