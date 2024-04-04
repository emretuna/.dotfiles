return {
  'ahmedkhalf/project.nvim',
  event = 'VeryLazy',
  cmd = 'ProjectRoot',
  opts = {
    -- How to find root directory
    patterns = {
      '.git',
      '_darcs',
      '.hg',
      '.bzr',
      '.svn',
      'Makefile',
      'package.json',
      '.solution',
      '.solution.toml',
    },
    -- Don't list the next projects
    exclude_dirs = {
      '~/',
    },
    silent_chdir = true,
    manual_mode = false,

    --ignore_lsp = { "lua_ls" },
  },
  config = function(_, opts)
    require('project_nvim').setup(opts)
  end,
}
