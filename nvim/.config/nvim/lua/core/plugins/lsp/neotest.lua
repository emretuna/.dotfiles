return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    -- 'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- Custom test suites
    'olimorris/neotest-phpunit',
    'marilari88/neotest-vitest',
    'nvim-neotest/neotest-jest',
    'thenbe/neotest-playwright',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-phpunit',
        require 'neotest-vitest',
        require 'neotest-jest' {
          jestCommand = 'npm test --',
          jestConfigFile = 'custom.jest.config.ts',
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },
        require 'neotest-playwright',
      },
    }
  end,
}
