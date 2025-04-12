---@type LazySpec
return {
  {
    "b0o/schemastore.nvim",
    lazy = true,
    specs = {
      {
        "AstroNvim/astrolsp",
        optional = true,
        ---@type AstroLSPOpts
        opts = {
          ---@diagnostic disable: missing-fields
          config = {
            jsonls = {
              on_new_config = function(config)
                if not config.settings.json.schemas then config.settings.json.schemas = {} end
                vim.list_extend(
                  config.settings.json.schemas,
                  require("schemastore").json.schemas {
                    replace = {
                      ["Grafana 5.x Dashboard"] = {
                        description = "Grafana 5.x Dashboards",
                        fileMatch = { "grafana.json" },
                        name = "Grafana 5.x Dashboard",
                        url = "https://www.schemastore.org/grafana-dashboard-5.x.json",
                      },
                    },
                  }
                )
              end,
              settings = { json = { validate = { enable = true } } },
            },
          },
        },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      treesitter = { ensure_installed = { "json" } },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "jsonls" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "json-lsp" })
    end,
  },
}
