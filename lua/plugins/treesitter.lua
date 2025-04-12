-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  optional = true,
  opts = function(_, opts)
    if opts.ensure_installed ~= "all" then
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua",
        "vim",
        "desktop",
        "git_config",
        "gitattributes",
        "ini",
        "jsonnet",
        "powershell",
        "regex",
        "ssh_config",
      })
    end
  end,
}
