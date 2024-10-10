return {
  'mrjones2014/smart-splits.nvim',
  event = 'VeryLazy',
  opts = {},
  config = function(_, opts)
    require('smart-splits').setup(opts)

    -- recommended mappings
    -- resizing splits
    -- these keymaps will also accept a range,
    -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
    vim.keymap.set('n', '<A-Left>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<A-Down>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<A-Up>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<A-Right>', require('smart-splits').resize_right)
    -- moving between splits
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
    -- swapping buffers between windows
    vim.keymap.set('n', '<leader>bh', require('smart-splits').swap_buf_left, { desc = 'Swap Buffer To Left' })
    vim.keymap.set('n', '<leader>bj', require('smart-splits').swap_buf_down, { desc = 'Swap Buffer To Down' })
    vim.keymap.set('n', '<leader>bk', require('smart-splits').swap_buf_up, { desc = 'Swap Buffer To Up' })
    vim.keymap.set('n', '<leader>bl', require('smart-splits').swap_buf_right, { desc = 'Swap Buffer To Right' })
  end,
}
