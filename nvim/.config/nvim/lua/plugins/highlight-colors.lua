return {
  'brenoprata10/nvim-highlight-colors',
  event = 'VeryLazy',
  opts = {
    ---Render style
    ---@usage 'background'|'foreground'|'virtual'
    render = 'virtual',
    ---Set virtual symbol (requires render to be set to 'virtual')
    virtual_symbol = '⬤ ',

    ---Set virtual symbol position()
    ---@usage 'inline'|'eol'|'eow'
    ---inline mimics VS Code style
    ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
    ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
    virtual_symbol_position = 'eol',
  },
  config = function(_, opts)
    require('nvim-highlight-colors').setup(opts)
  end,
}
