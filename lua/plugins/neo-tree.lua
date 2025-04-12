return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("error", opts, {
        filesystem = {
          window = {
            mappings = {
              ["m"] = {
                "move",
                -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                config = {
                  show_path = "relative", -- "none", "relative", "absolute"
                },
              },
            },
          },
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
          },
        },
      })
    end,
  },
}
