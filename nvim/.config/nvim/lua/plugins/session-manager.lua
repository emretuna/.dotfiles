return {
  'Shatur/neovim-session-manager',
  cmd = 'SessionManager',
  opts = function()
    local config = require 'session_manager.config'
    return {
      autoload_mode = config.AutoloadMode.Disabled,
      autosave_last_session = false,
      autosave_only_in_session = false,
    }
  end,
  config = function(_, opts)
		require('session_manager').setup(opts)
    -- Auto save session
    -- BUG: This feature will auto-close anything nofile before saving.
    --      This include neotree, aerial, mergetool, among others.
    --      Consider commenting the next block if this is important for you.
    --
    --      This won't be necessary once neovim fixes:
    --      https://github.com/neovim/neovim/issues/12242
    -- vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    --   callback = function ()
    --     session_manager.save_current_session()
    --   end
    -- })
  end,
  vim.keymap.set('n', '<leader>wl', '<cmd>SessionManager! load_last_session<cr>', { desc = '[L]oad last session' }),
  vim.keymap.set('n', '<leader>wS', '<cmd>SessionManager! save_current_session <cr>', { desc = '[S]ave current session' }),
  vim.keymap.set('n', '<leader>wd', '<cmd>SessionManager! delete_session <cr>', { desc = '[D]elete session' }),
  vim.keymap.set('n', '<leader>wf', '<cmd>SessionManager! load_session <cr>', { desc = '[F]ind session' }),
  vim.keymap.set('n', '<leader>wc', '<cmd>SessionManager! load_current_dir_session <cr>', { desc = '[C]urrent dir session' }),
}
