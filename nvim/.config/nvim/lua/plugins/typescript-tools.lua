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
      code_lens_mode = 'all',
      expose_as_code_action = 'all',
      jsx_close_tag = {
        enable = true,
        filetypes = { 'javascriptreact', 'typescriptreact' },
      },
      separate_diagnostic_server = true,
      publish_diagnostic_on = 'insert_leave',
      tsserver_max_memory = 'auto',
      complete_function_calls = true,
      tsserver_file_preferences = {
        includeCompletionsForModuleExports = true,
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
        importModuleSpecifierPreference = 'non-relative',
        quotePreference = 'auto',
      },
      tsserver_format_options = {
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = false,
      },
      tsserver_plugins = {
        '@vue/typescript-plugin',
        -- for TypeScript v4.9+
        '@styled/typescript-styled-plugin',
        -- or for older TypeScript versions
        -- "typescript-styled-plugin",
      },
    },
  },
  config = function(_, opts)
    require('typescript-tools').setup(opts)
  end,
}
