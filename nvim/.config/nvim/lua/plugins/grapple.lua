return {
  'cbochs/grapple.nvim',
  event = 'VeryLazy',
  opts = {
    scope = 'git', -- also try out "git_branch"
    icons = true, -- setting to "true" requires "nvim-web-devicons"
    status = true,
  },
  config = function(_, opts)
		require('grapple').setup(opts)

    vim.keymap.set('n', '<leader>;m', '<cmd>Grapple toggle_tags<cr>', { desc = 'Grapple [M]enu' })
    vim.keymap.set('n', '<leader>;t', '<cmd>Grapple toggle<cr>', { desc = 'Grapple [T]oggle' })
    vim.keymap.set('n', '<leader>;s', '<cmd>Grapple open_scopes<cr>', { desc = 'Grapple [S]copes' })
    vim.keymap.set('n', '[g', '<cmd>Grapple cycle forward<cr>', { desc = 'Grapple Next' })
    vim.keymap.set('n', ']g', '<cmd>Grapple cycle backward<cr>', { desc = 'Grapple Prev' })
  end,
}
