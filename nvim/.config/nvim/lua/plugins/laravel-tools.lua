return {
  'adalessa/laravel.nvim',
  event = 'VeryLazy',
  ft = { 'php', 'blade' },
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'tpope/vim-dotenv',
    'MunifTanjim/nui.nvim',
  },
  cmd = { 'Sail', 'Artisan', 'Composer', 'Npm', 'Yarn', 'Laravel' },
  config = function()
    require('laravel').setup {
      lsp_server = 'phpactor',
      register_user_commands = true,
      features = {
        null_ls = {
          enable = false,
        },
        route_info = {
          enable = true,
          position = 'right',
        },
      },
      ui = require 'laravel.config.ui',
      commands_options = require 'laravel.config.command_options',
      environments = require 'laravel.config.environments',
      user_commands = require 'laravel.config.user_commands',
      resources = require 'laravel.config.resources',
    }
  end,
  init = function()
    vim.keymap.set('n', '<leader>lla', '<cmd>:Laravel artisan<cr>', { desc = '[A]rtisan' })
    vim.keymap.set('n', '<leader>llr', '<cmd>:Laravel routes<cr>', { desc = '[R]outes' })
    vim.keymap.set('n', '<leader>llm', '<cmd>:Laravel related<cr>', { desc = '[M]odel Classes' })
  end,
}
