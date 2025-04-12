--vim.opt.listchars:append "space:·" -- Set listchars to include space
-- :set lcs+=space:·

-- :set expandtab?
-- :set shiftwidth?
-- :set tabstop?
-- :set linebreak?
-- :set breakindent?
-- :set filetype?
return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        indent = {
          enabled = false,
          --char = "│",
          hl = {
            "SnacksIndent1",
            "SnacksIndent2",
            "SnacksIndent3",
            "SnacksIndent4",
            "SnacksIndent5",
            "SnacksIndent6",
            "SnacksIndent7",
            "SnacksIndent8",
          },
        },
        scope = {
          --char = "│",
          hl = {
            "RainbowDelimiterRed",
            "RainbowDelimiterYellow",
            "RainbowDelimiterBlue",
            "RainbowDelimiterOrange",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
          },
        },
        chunk = {
          enabled = false,
          hl = {
            "RainbowDelimiterRed",
            "RainbowDelimiterYellow",
            "RainbowDelimiterBlue",
            "RainbowDelimiterOrange",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
          },
        },
      },
    },
  },
}
