return {
  'pmizio/typescript-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
    { 'dmmulroy/ts-error-translator.nvim', opts = {
      auto_override_publish_diagnostics = true,
    } },
  },
  opts = {
    single_file_support = false,
    root_dir = require('lspconfig').util.root_pattern('tsconfig.json', 'jsconfig.json', 'package.json', '.git'),
    settings = {
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all',
        includeCompletionsForModuleExports = true,
        quotePreference = 'auto',
      },
      tsserver_format_options = {
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = false,
      },
      tsserver_plugins = {
        -- for TypeScript v4.9+
        '@styled/typescript-styled-plugin',
        -- or for older TypeScript versions
        -- "typescript-styled-plugin",
      },
    },
  },
  config = function(_, opts)
    require('typescript-tools').setup(opts)

    vim.keymap.set('n', '<leader>mts', '<cmd>:TSToolsSortImports<cr>', { desc = '[S]ort Imports' })
    vim.keymap.set('n', '<leader>mtu', '<cmd>:TSToolsRemoveUnusedImports<cr>', { desc = 'Remove [U]nused' })
    vim.keymap.set('n', '<leader>mte', '<cmd>:TSToolsRemoveUnused<cr>', { desc = 'Remove [E]mpty Statements' })
    vim.keymap.set('n', '<leader>mta', '<cmd>:TSToolsAddMissingImports<cr>', { desc = '[A]dd Missing Imports' })
    vim.keymap.set('n', '<leader>mtf', '<cmd>:TSToolsFixAll<cr>', { desc = '[F]ix Errors' })
    vim.keymap.set('n', '<leader>mtd', '<cmd>:TSToolsGoToSourceDefinition<cr>', { desc = 'Source [D]efinition' })
    vim.keymap.set('n', '<leader>mtr', '<cmd>:TSToolsRenameFile<cr>', { desc = '[R]ename File' })
    vim.keymap.set('n', '<leader>mtR', '<cmd>:TSToolsFileReferences<cr>', { desc = 'File [R]eferences' })
  end,
}
