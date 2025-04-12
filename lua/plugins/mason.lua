-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    optional = true,
    opts = function(_, opts)
      -- Make sure to use the names found in `:Mason`
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- install language servers
        "lua-language-server",
        "jsonnet-language-server",

        -- install formatters
        "stylua",
        "jsonnetfmt",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      })
    end,
  },
}
