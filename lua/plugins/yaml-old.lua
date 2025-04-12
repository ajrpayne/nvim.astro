if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
  {
    "cenk1cenk2/schema-companion.nvim",
    ft = { "yaml" },
    specs = {
      {
        "AstroNvim/astrolsp",
        optional = true,
        opts = function(_, opts)
          opts.config.yamlls = nil
          opts.handlers.yamlls = false
        end,
      },
    },
    opts = function(_, opts)
      local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
      local astrolsp_opts = (astrolsp_avail and astrolsp.lsp_opts "yamlls") or {}
      -- Pass any additional options that will be merged in the final LSP config
      opts.lspconfig = vim.tbl_deep_extend("force", astrolsp_opts, {
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            completion = true,
            format = { enable = true },
            hover = true,
            validate = true,
            schemaStore = { enable = false, url = "" },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })
    end,
    config = function(_, opts)
      require("schema-companion").setup {
        log_level = vim.log.levels.INFO,
      }
      --vim.notify(vim.inspect(opts.lspconfig))
      require("lspconfig").yamlls.setup(
        require("schema-companion").setup_client(
          require("schema-companion").adapters.yamlls.setup {
            sources = {
              require("schema-companion").sources.matchers.kubernetes.setup { version = "master" },
              require("schema-companion").sources.lsp.setup(),
              require("schema-companion").sources.schemas.setup {
                {
                  name = "Argo CD Application",
                  uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json",
                },
                {
                  name = "SealedSecret",
                  uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/bitnami.com/sealedsecret_v1alpha1.json",
                },
              },
            },
          },
          opts.lspconfig
        )
      )
      vim.keymap.set(
        "n",
        "<leader>ya",
        function() require("schema-companion").select_schema() end,
        { desc = "Select ANY YAML Schema" }
      )
      vim.keymap.set(
        "n",
        "<leader>ym",
        function() require("schema-companion").select_matching_schema() end,
        { desc = "Select MATCHING YAML Schema" }
      )
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "yaml" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
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
