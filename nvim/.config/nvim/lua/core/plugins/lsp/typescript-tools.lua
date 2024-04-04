return {
  'pmizio/typescript-tools.nvim',
  ft = { 'typescript', 'typescriptreact' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
    { 'dmmulroy/ts-error-translator.nvim', opts = {
      auto_override_publish_diagnostics = true,
    } },
  },
  config = function()
    require('typescript-tools').setup {
      tsserver_plugins = {
        -- for TypeScript v4.9+
        '@styled/typescript-styled-plugin',
        -- or for older TypeScript versions
        -- "typescript-styled-plugin",
      },
    }

    vim.keymap.set('n', '<leader>lts', '<cmd>:TSToolsSortImports<cr>', { desc = '[S]ort Imports' })
    vim.keymap.set('n', '<leader>ltu', '<cmd>:TSToolsRemoveUnusedImports<cr>', { desc = 'Remove [U]nused' })
    vim.keymap.set('n', '<leader>lte', '<cmd>:TSToolsRemoveUnused<cr>', { desc = 'Remove [E]mpty Statements' })
    vim.keymap.set('n', '<leader>lta', '<cmd>:TSToolsAddMissingImports<cr>', { desc = '[A]dd Missing Imports' })
    vim.keymap.set('n', '<leader>ltf', '<cmd>:TSToolsFixAll<cr>', { desc = '[F]ix Errors' })
    vim.keymap.set('n', '<leader>ltd', '<cmd>:TSToolsGoToSourceDefinition<cr>', { desc = 'Source [D]efinition' })
    vim.keymap.set('n', '<leader>ltr', '<cmd>:TSToolsRenameFile<cr>', { desc = '[R]ename File' })
    vim.keymap.set('n', '<leader>ltR', '<cmd>:TSToolsFileReferences<cr>', { desc = 'File [R]eferences' })
  end,
}
