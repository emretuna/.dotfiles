return {
  'OXY2DEV/markview.nvim',
  lazy = false, -- Recommended
  ft = { 'markdown', 'norg', 'rmd', 'org', 'vimwiki', 'Avante' },
  opts = {
    filetypes = { 'markdown', 'norg', 'rmd', 'org', 'vimwiki', 'Avante' },
    buf_ignore = {},
    max_length = 99999,
  },
  dependencies = {
    -- You will not need this if you installed the
    -- parsers manually
    -- Or if the parsers are in your $RUNTIMEPATH
    'nvim-treesitter/nvim-treesitter',

    'nvim-tree/nvim-web-devicons',
  },
}
