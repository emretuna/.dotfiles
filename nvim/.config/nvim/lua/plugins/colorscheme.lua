return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    enabled = false,
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    opts = {
      --- @usage 'auto'|'main'|'moon'|'dawn'
      dark_variant = 'main',
      disable_italics = true,
      styles = {
        transparency = true,
      },
    },
    init = function()
      vim.cmd 'colorscheme rose-pine'
    end,
  },
}
