return {
  'cbochs/grapple.nvim',
  lazy = true,
  opts = {
    scope = 'git', -- also try out "git_branch"
    icons = true, -- setting to "true" requires "nvim-web-devicons"
    status = true,
  },
  keys = {
    { '<leader>;m', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple [M]enu' },
    { '<leader>;t', '<cmd>Grapple toggle<cr>', desc = 'Grapple [T]oggle' },
    { '<leader>;s', '<cmd>Grapple open_scopes<cr>', desc = 'Grapple [S]copes' },
    { '[g', '<cmd>Grapple cycle forward<cr>', desc = 'Grapple Next' },
    { ']g', '<cmd>Grapple cycle backward<cr>', desc = 'Grapple Prev' },
  },
}
