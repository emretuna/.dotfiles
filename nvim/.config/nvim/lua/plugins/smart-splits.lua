return {
  'mrjones2014/smart-splits.nvim',
  event = 'VeryLazy',
  opts = {},
  init = function()
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
    vim.keymap.set('n', '<leader>uh', require('smart-splits').swap_buf_left, { desc = 'Swap buffer to left' })
    vim.keymap.set('n', '<leader>uj', require('smart-splits').swap_buf_down, { desc = 'Swap buffer to down' })
    vim.keymap.set('n', '<leader>uk', require('smart-splits').swap_buf_up, { desc = 'Swap buffer to up' })
    vim.keymap.set('n', '<leader>ul', require('smart-splits').swap_buf_right, { desc = 'Swap buffer to right' })
  end,
}
