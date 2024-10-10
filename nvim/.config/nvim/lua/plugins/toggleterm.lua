return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  cmd = { 'ToggleTerm', 'TermExec' },
  opts = {
    highlights = {
      Normal = { link = 'Normal' },
      NormalNC = { link = 'NormalNC' },
      NormalFloat = { link = 'Normal' },
      FloatBorder = { link = 'FloatBorder' },
      StatusLine = { link = 'StatusLine' },
      StatusLineNC = { link = 'StatusLineNC' },
      WinBar = { link = 'WinBar' },
      WinBarNC = { link = 'WinBarNC' },
    },
    size = 10,
    open_mapping = [[<c-\>]],
    shading_factor = 2,
    direction = 'float',
    float_opts = {
      border = 'rounded',
      highlights = { border = 'Normal', background = 'Normal' },
    },
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    vim.keymap.set('n', '<F7>', '<cmd>ToggleTerm<cr>', { desc = 'Toggle Terminal' })
  end,
}
