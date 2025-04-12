if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "someone-stole-my-name/yaml-companion.nvim",
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
      -- detect k8s schemas based on file content
      opts.builtin_matchers = {
        kubernetes = { enabled = true },
        cloud_init = { enabled = true },
      }
      -- schemas available in Telescope picker
      opts.schemas = {
        -- not loaded automatically, manually select with
        -- :Telescope yaml_schema
        {
          name = "Argo CD Application",
          uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json",
        },
        {
          name = "SealedSecret",
          uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/bitnami.com/sealedsecret_v1alpha1.json",
        },
        -- schemas below are automatically loaded, but added
        -- them here so that they show up in the statusline
        {
          name = "Azure Pipelines",
          uri = "https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json",
        },
        {
          name = "GitHub Workflow",
          uri = "https://json.schemastore.org/github-workflow.json",
        },
        {
          name = "Kustomization",
          uri = "https://json.schemastore.org/kustomization.json",
        },
        {
          name = "Prometheus",
          uri = "https://json.schemastore.org/prometheus.json",
        },
        {
          name = "Prometheus Rules",
          uri = "https://json.schemastore.org/prometheus.rules.json",
        },
        {
          name = "Prometheus Rules Test",
          uri = "https://json.schemastore.org/prometheus.rules.test.json",
        },
      }
      -- Pass any additional options that will be merged in the final LSP config
      opts.lspconfig = vim.tbl_deep_extend("force", astrolsp_opts, {
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            schemaStore = { enable = false, url = "" },
            -- schemas from store, matched by filename
            -- loaded automatically
            schemas = require("schemastore").yaml.schemas {
              select = {
                "Azure Pipelines",
                "GitHub Workflow",
                "kustomization.yaml",
                "prometheus.json",
                "prometheus.rules.json",
                "prometheus.rules.test.json",
              },
            },
          },
        },
      })
    end,
    config = function(_, opts)
      local cfg = require("yaml-companion").setup(opts)
      require("lspconfig").yamlls.setup(cfg)
      --require("telescope").load_extension "yaml_schema"
    end,
  },
}
