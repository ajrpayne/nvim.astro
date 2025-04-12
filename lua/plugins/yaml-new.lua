---@type LazySpec
return {
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
  {
    "cenk1cenk2/schema-companion.nvim",
    ft = { "yaml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      {
        "<leader>ya",
        function() require("schema-companion").select_schema() end,
        "n",
        "yaml",
        desc = "Select ANY YAML Schema",
      },
      {
        "<leader>ym",
        function() require("schema-companion").select_matching_schema() end,
        "n",
        "yaml",
        desc = "Select MATCHING YAML Schema",
      },
      {
        "<leader>yr",
        function() require("schema-companion").match() end,
        "n",
        "yaml",
        desc = "REMATCH YAML Schema",
      },
    },
  },
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      treesitter = { ensure_installed = { "yaml" } },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "yamlls" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "yaml-language-server" })
    end,
  },
}
