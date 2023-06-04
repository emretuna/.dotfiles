return {
  -- add catppuccin
  { "catppuccin/nvim" },
  { "Shatur/neovim-ayu" },
  { "rebelot/kanagawa.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },

  -- Configure LazyVim to load themes
  {
    "LazyVim/LazyVim",
    opts = {
      -- kanagawa-wave
      -- kanagawa-lotus
      -- kanagawa-dragon
      -- ayu-dark
      -- ayu-light
      -- ayu-mirage
      -- catppuccin-latte
      -- catppuccin-frappe
      -- catppuccin-macchiato
      -- catppuccin-mocha
      colorscheme = "rose-pine",
    },
  },
}
