if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "stevearc/oil.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("error", opts, {
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
        },
      })
    end,
  },
}
