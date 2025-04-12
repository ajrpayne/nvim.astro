if vim.g.vscode then return {} end

---@type LazySpec
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options = {
        theme = "moonbow",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        refresh = {
          statusline = 200,
          tabline = 200,
          winbar = 200,
        },
      }
      opts.sections = {
        lualine_z = {
          {
            "location",
          },
          {
            function() return ("%s"):format(require("schema-companion").get_current_schemas() or "none"):sub(0, 128) end,
            cond = function()
              return package.loaded["schema-companion"] and require("schema-companion").get_current_schemas() ~= nil
            end,
          },
        },
      }
    end,
  },
}
