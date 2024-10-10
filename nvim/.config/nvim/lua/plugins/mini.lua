return {
  {
    'echasnovski/mini.clue',
    opts = function()
      return {
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },

          -- Bracketed
          { mode = 'n', keys = '[' },
          { mode = 'n', keys = ']' },
        },
        window = {
          delay = 10,
        },
        clues = {
          { mode = 'n', keys = '<Leader>a', desc = 'Ai' },
          { mode = 'n', keys = '<Leader>b', desc = 'Buffers' },
          { mode = 'n', keys = '<Leader>f', desc = 'Find' },
          { mode = 'n', keys = '<Leader>g', desc = 'Git' },
          { mode = 'n', keys = '<Leader>h', desc = 'Http' },
          { mode = 'n', keys = '<Leader>l', desc = 'Lsp' },
          { mode = 'n', keys = '<Leader>n', desc = 'Notes' },
          { mode = 'n', keys = '<Leader>s', desc = 'Search' },
          { mode = 'n', keys = '<Leader>t', desc = 'Tabs' },
          { mode = 'n', keys = '<Leader>m', desc = 'Misc' },
          { mode = 'n', keys = '<Leader>x', desc = 'Trouble' },
          -- Enhance this by adding descriptions for <Leader> mapping groups
          require('mini.clue').gen_clues.builtin_completion(),
          require('mini.clue').gen_clues.g(),
          require('mini.clue').gen_clues.marks(),
          require('mini.clue').gen_clues.registers(),
          require('mini.clue').gen_clues.windows(),
          require('mini.clue').gen_clues.z(),
        },
      }
    end,
  },
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {},
    config = function(_, opts)
      require('mini.pairs').setup(opts)
    end,
  },
  {
    'echasnovski/mini.hipatterns',
    event = 'VeryLazy',
    opts = {
      highlighters = {
        fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
        hack = { pattern = 'HACK', group = 'MiniHipatternsHack' },
        todo = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
        note = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
      },
    },
    config = function(_, opts)
      require('mini.hipatterns').setup(opts)
    end,
  },
  {
    'echasnovski/mini.jump2d',
    event = 'VeryLazy',
    opts = {
      view = {
        dim = true,
      },
      silent = true,
    },
    config = function(_, opts)
      require('mini.jump2d').setup(opts)
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    config = function()
      require('mini.splitjoin').setup {
        mappings = {
          toggle = 'gS',
        },
      }
    end,
  },
  {
    'echasnovski/mini.icons',
    lazy = true,
    opts = {
      extension = {
        ['http'] = { glyph = '󰖟', hl = 'MiniIconsGreen' },
        ['rest'] = { glyph = '󱂛', hl = 'MiniIconsBlue' },
        ['.eslintrc.js'] = { glyph = '󰱺', hl = 'MiniIconsYellow' },
        ['.node-version'] = { glyph = '', hl = 'MiniIconsGreen' },
        ['.prettierrc'] = { glyph = '', hl = 'MiniIconsPurple' },
        ['.yarnrc.yml'] = { glyph = '', hl = 'MiniIconsBlue' },
        ['eslint.config.js'] = { glyph = '󰱺', hl = 'MiniIconsYellow' },
        ['package.json'] = { glyph = '', hl = 'MiniIconsGreen' },
        ['tsconfig.json'] = { glyph = '', hl = 'MiniIconsAzure' },
        ['tsconfig.build.json'] = { glyph = '', hl = 'MiniIconsAzure' },
        ['yarn.lock'] = { glyph = '', hl = 'MiniIconsBlue' },
      },
    },
  },
  {
    'echasnovski/mini.indentscope',
    event = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
      require('mini.indentscope').setup {
        symbol = '│',
        options = { try_as_border = true },
      }
    end,
  },
  { 'echasnovski/mini.tabline', event = 'VimEnter', opts = { show_icons = true } },
  { 'echasnovski/mini.ai', event = 'BufReadPost', opts = { n_lines = 500 } },
  { 'echasnovski/mini.surround', event = 'BufReadPost', opts = {} },
  {
    'echasnovski/mini.animate',
    event = 'VeryLazy',
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs { 'Up', 'Down' } do
        local key = '<ScrollWheel' .. scroll .. '>'
        vim.keymap.set({ '', 'i' }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require 'mini.animate'
      return {
        open = { enable = false }, -- true causes issues on nvim-spectre
        resize = {
          timing = animate.gen_timing.linear { duration = 33, unit = 'total' },
        },
        scroll = {
          timing = animate.gen_timing.linear { duration = 50, unit = 'total' },
          subscroll = animate.gen_subscroll.equal {
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          },
        },
        cursor = {
          enable = false, -- We don't want cursor ghosting
          timing = animate.gen_timing.linear { duration = 26, unit = 'total' },
        },
      }
    end,
    config = function(_, opts)
      require('mini.animate').setup(opts)
    end,
  },
  {
    'echasnovski/mini.statusline',
    dependencies = {
      'otavioschwanck/arrow.nvim',
    },
    event = 'VeryLazy',
    opts = function()
      return {
        use_icons = vim.g.have_nerd_font,
        content = {
          active = function()
            local MiniStatusline = require 'mini.statusline'
            local blocked_filetypes = { ['neo-tree'] = true }
            if blocked_filetypes[vim.bo.filetype] then
              vim.cmd 'highlight StatusLine guibg=NONE guifg=NONE'
              return ''
            end
            local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
            local git = MiniStatusline.section_git { trunc_width = 75 }
            local diff = MiniStatusline.section_diff { trunc_width = 75 }
            local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
            local filename = MiniStatusline.section_filename { trunc_width = 140 }
            local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
            local location = MiniStatusline.section_location { trunc_width = 75 }
            local search = MiniStatusline.section_searchcount { trunc_width = 75 }
            local arrow = require('arrow.statusline').text_for_statusline_with_icons()

            return MiniStatusline.combine_groups {
              { hl = mode_hl, strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, arrow } },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl, strings = { search, location } },
            }
          end,
        },
      }
    end,
    config = function(_, opts)
      require('mini.statusline').setup(opts)
    end,
  },
}
