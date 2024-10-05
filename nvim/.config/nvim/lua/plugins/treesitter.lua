return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    opts = {
      ensure_installed = {
        'bash',
        'css',
        'diff',
        'dockerfile',
        'gitignore',
        'graphql',
        'html',
        'http',
        'javascript',
        'json',
        'json5',
        'jsonc',
        'lua',
        'markdown',
        'markdown_inline',
        'php',
        'phpdoc',
        'prisma',
        'query',
        'regex',
        'svelte',
        'tsx',
        'typescript',
        'vim',
        'xml',
        'yaml',
      }, -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = true,
    opts = {
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']f'] = { query = '@call.outer', desc = 'Next function call start' },
            [']m'] = { query = '@function.outer', desc = 'Next method/function def start' },
            [']c'] = { query = '@class.outer', desc = 'Next class start' },
            [']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
            [']l'] = { query = '@loop.outer', desc = 'Next loop start' },

            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
            [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
          },
          goto_next_end = {
            [']F'] = { query = '@call.outer', desc = 'Next function call end' },
            [']M'] = { query = '@function.outer', desc = 'Next method/function def end' },
            [']C'] = { query = '@class.outer', desc = 'Next class end' },
            [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
            [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@call.outer', desc = 'Prev function call start' },
            ['[m'] = { query = '@function.outer', desc = 'Prev method/function def start' },
            ['[c'] = { query = '@class.outer', desc = 'Prev class start' },
            ['[i'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
            ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
          },
          goto_previous_end = {
            ['[F'] = { query = '@call.outer', desc = 'Prev function call end' },
            ['[M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
            ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
            ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
            ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
          },
        },
      },
    },
    config = function(_, opts)
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup { opts }

      local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

      -- vim way: ; goes to the direction you were moving.
      vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
      vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = true,
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    },
    config = function(_, opts)
      require('treesitter-context').setup(opts)

      vim.keymap.set('n', '[/', function()
        require('treesitter-context').go_to_context()
      end, { desc = 'Go to Context' })
    end,
  },
}
