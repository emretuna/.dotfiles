return {
  'akinsho/toggleterm.nvim',
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
}
