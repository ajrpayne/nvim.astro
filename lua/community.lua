-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine", enabled = false },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.file-explorer.oil-nvim", enabled = false },
  { import = "astrocommunity.indent.snacks-indent-hlchunk" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.helm" },
  { import = "astrocommunity.pack.json", enabled = false },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.ps1" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml", enabled = false },
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.quickfix.quicker-nvim" },
  { import = "astrocommunity.scrolling.cinnamon-nvim", enabled = false },
  { import = "astrocommunity.scrolling.mini-animate", enabled = false },
  { import = "astrocommunity.scrolling.neoscroll-nvim", enabled = false },
  { import = "astrocommunity.search.grug-far-nvim" },
  { import = "astrocommunity.recipes.auto-session-restore", enabled = false },
  { import = "astrocommunity.recipes.neovide", enabled = false },
  { import = "astrocommunity.recipes.vscode", enabled = false },
  -- import/override with your plugins folder
}
