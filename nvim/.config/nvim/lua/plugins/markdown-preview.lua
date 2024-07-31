return {
  'iamcco/markdown-preview.nvim',
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  ft = { 'markdown' },
  cmd = {
    'MarkdownPreview',
    'MarkdownPreviewStop',
    'MarkdownPreviewToggle',
  },
  keys = {
    {
      '<leader>wm',
      ft = 'markdown',
      '<cmd>MarkdownPreviewToggle<cr>',
      desc = '[M]arkdown Preview',
    },
  },
  config = function()
    vim.cmd [[do FileType]]
  end,
}
