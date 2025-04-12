if not vim.g.neovide then return {} end

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      g = { -- configure vim.g variables
        -- configure scaling
        neovide_scale_factor = 0.7,
        -- configure animation
        neovide_cursor_animation_length = 0.01,
      },
    },
  },
}
