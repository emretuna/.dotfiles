return {
  'nvim-pack/nvim-spectre',
  cmd = 'Spectre',
  lazy = true,
  config = function()
    require('spectre').setup {
      default = {
        find = {
          -- pick one of item in find_engine [ fd, rg ]
          cmd = 'fd',
          options = {},
        },
        replace = {
          -- pick one of item in [ sed, oxi ]
          cmd = 'sed',
        },
      },
      is_insert_mode = true, -- start open panel on is_insert_mode
      is_block_ui_break = true, -- prevent the UI from breaking
    }
  end,
  vim.keymap.set('n', '<leader>s.', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = '[T]oggle Spectre',
  }),
  vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = 'Search [W]ord',
  }),
  vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = 'Search [W]ord',
  }),
  vim.keymap.set('n', '<leader>sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = 'Search [C]urrent File',
  }),
}
