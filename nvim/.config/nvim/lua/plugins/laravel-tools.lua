return {
  'adalessa/laravel.nvim',
  ft = { 'php', 'blade' },
  event = 'VeryLazy',
  enabled = false, -- TODO: Will be enabled again after fzf-lua support added
  dependencies = {
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
          enable = true, --- to enable the laravel.nvim virtual text
          position = 'right', --- where to show the info (available options 'right', 'top')
          middlewares = true, --- wheather to show the middlewares section in the info
          method = true, --- wheather to show the method section in the info
          uri = true, --- wheather to show the uri section in the info
        },
      },
      ui = require 'laravel.config.ui',
      commands_options = require 'laravel.config.command_options',
      environments = require 'laravel.config.environments',
      user_commands = require 'laravel.config.user_commands',
      resources = require 'laravel.config.resources',
    }

    vim.keymap.set('n', '<leader>mla', '<cmd>:Laravel artisan<cr>', { desc = '[A]rtisan' })
    vim.keymap.set('n', '<leader>mlr', '<cmd>:Laravel routes<cr>', { desc = '[R]outes' })
    vim.keymap.set('n', '<leader>mlm', '<cmd>:Laravel related<cr>', { desc = '[M]odel Classes' })
  end,
}
