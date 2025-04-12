return require("schema-companion").setup_client(
  require("schema-companion").adapters.yamlls.setup {
    sources = {
      require("schema-companion").sources.matchers.kubernetes.setup { version = "master" },
      require("schema-companion").sources.lsp.setup(),
      require("schema-companion").sources.schemas.setup {
        {
          name = "Kubernetes master",
          uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json",
        },
        {
          name = "Argo CD Application",
          uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json",
        },
        {
          name = "SealedSecret",
          uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/bitnami.com/sealedsecret_v1alpha1.json",
        },
      },
      require("schema-companion").sources.none.setup(),
    },
  },
  ---@diagnostic disable: missing-fields
  {
    settings = {
      redhat = {
        telemetry = {
          enabled = false,
        },
      },
      yaml = {
        completion = true,
        format = {
          enable = true,
        },
        hover = true,
        schemaStore = {
          enable = false,
          url = "",
        },
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
        validate = true,
      },
    },
  }
)
