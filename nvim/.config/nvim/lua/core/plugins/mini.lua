return {
  {
    'echasnovski/mini.indentscope',
    event = 'BufRead',
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
  -- Not required for > neovim 0.10
  -- {
  --   'echasnovski/mini.comment',
  --   event = 'VeryLazy',
  --   dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true, opts = { enable_autocmd = false } },
  --   opts = {
  --     options = {
  --       custom_commentstring = function()
  --         return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
  --       end,
  --     },
  --   },
  -- },
  { 'echasnovski/mini.tabline', event = 'VeryLazy', opts = { show_icons = true } },
  { 'echasnovski/mini.ai', event = 'BufReadPost', opts = { n_lines = 500 } },
  { 'echasnovski/mini.surround', event = 'BufReadPost', opts = {} },
  {
    'echasnovski/mini.animate',
    event = 'VeryLazy',
    config = function()
      require('mini.animate').setup {
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
      }
    end,
  },
  {
    'echasnovski/mini.statusline',
    event = 'VeryLazy',
    config = function()
      require('mini.statusline').setup {
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
            local grapple = require('grapple').statusline {}

            return MiniStatusline.combine_groups {
              { hl = mode_hl, strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, grapple } },
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
  },
}
