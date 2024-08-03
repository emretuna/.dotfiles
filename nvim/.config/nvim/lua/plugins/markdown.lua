return {
  'MeanderingProgrammer/markdown.nvim',
  ft = { 'markdown', 'norg', 'rmd', 'org' },
  event = 'BufReadPre',
  opts = {
    code = {
      sign = false,
      width = 'block',
      right_pad = 1,
    },
    heading = {
      sign = false,
      icons = {},
    },
  },
  config = function(_, opts)
    require('render-markdown').setup(opts)
    vim.keymap.set('n', '<leader>wm', '<cmd>RenderMarkdown toggle<cr>', { desc = '[M]arkdown Toggle' })
  end,
}
