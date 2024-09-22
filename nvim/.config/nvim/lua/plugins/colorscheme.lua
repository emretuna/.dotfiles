return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:FzfLua colorschemes`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    enabled = false,
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
    config = function(_, opts)
      require('rose-pine').setup(opts)
      vim.cmd 'colorscheme rose-pine'
    end,
  },
}
