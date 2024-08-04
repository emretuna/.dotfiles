-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
