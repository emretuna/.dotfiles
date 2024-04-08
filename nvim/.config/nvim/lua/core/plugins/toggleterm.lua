return {
  'akinsho/toggleterm.nvim',
  lazy = true,
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
    open_mapping = [[<F7>]],
    shading_factor = 2,
    direction = 'float',
    float_opts = {
      border = 'rounded',
      highlights = { border = 'Normal', background = 'Normal' },
    },
  },
  keys = {
    { 'F7', '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal' },
    { '<leader>tt', '<cmd>ToggleTerm direction=float<cr>', desc = '[T]oggle [T]erminal' },
    { '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', desc = '[T]oggle [H]orizantal' },
    { '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>', desc = '[T]oggle [V]ertical' },
  },
}
