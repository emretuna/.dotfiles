return {
  'brenoprata10/nvim-highlight-colors',
  event = 'VeryLazy',
  opts = {
    ---Render style
    ---@usage 'background'|'foreground'|'virtual'
    render = 'foreground',
  },
  config = function(_, opts)
    require('nvim-highlight-colors').setup(opts)
  end,
}
