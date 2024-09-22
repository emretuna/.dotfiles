return {
  'kristijanhusak/vim-dadbod-ui',
  event = 'VeryLazy',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true, enabled = vim.g.dadbod_enabled },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true, enabled = vim.g.dadbod_enabled }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  enabled = vim.g.dadbod_enabled,
  config = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.vim_dadbod_completion_mark = '󱘲'

    local autocomplete_group = vim.api.nvim_create_augroup('vimrc_autocompletion', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'sql', 'mysql', 'plsql' },
      callback = function()
        local cmp = require 'cmp'
        local global_sources = cmp.get_config().sources
        local buffer_sources = {}

        -- add globally defined sources (see separate nvim-cmp config)
        -- this makes e.g. luasnip snippets available since luasnip is configured globally
        if global_sources then
          for _, source in ipairs(global_sources) do
            table.insert(buffer_sources, { name = source.name })
          end
        end

        -- add vim-dadbod-completion source
        table.insert(buffer_sources, { name = 'vim-dadbod-completion' })

        -- update sources for the current buffer
        cmp.setup.buffer { sources = buffer_sources }
      end,
      group = autocomplete_group,
    })
  end,
}
