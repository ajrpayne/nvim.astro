return {
  {
    "kaplanz/retrail.nvim",
    opts = {
      hlgroup = "Search",
      -- Trim on write behaviour.
      trim = {
        -- Auto trim on BufWritePre
        auto = false,
        -- Trailing whitespace as highlighted.
        whitespace = true,
        -- Final blank (i.e. whitespace only) lines.
        blanklines = true,
      },
    }, -- calls `setup` using provided `opts`
  },
}
