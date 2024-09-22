return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  event = 'VeryLazy',
  opts = {
    use_default_keymaps = false,
  },
  config = function(_, opts)
    require('treesj').setup(opts)

    vim.keymap.set('n', 'gm', require('treesj').toggle, { desc = '[M]erge with treesj' })
    vim.keymap.set('n', 'gs', require('treesj').split, { desc = '[S]plit with treesj' })
    vim.keymap.set('n', 'gj', require('treesj').join, { desc = '[J]oin with treesj' })
  end,
}
