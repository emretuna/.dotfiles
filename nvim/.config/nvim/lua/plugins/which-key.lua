return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup {
      preset = 'helix',
      win = {
        no_overlap = false,
        border = 'rounded',
      },
      icons = {
        rules = false,
      },
    }
    local wk = require 'which-key'
    wk.add {
      { '<leader>;', group = '[󱁅]Grapple' },
      { '<leader>;_', hidden = true },
      { '<leader>a', group = '[A]i' },
      { '<leader>a_', hidden = true },
      { '<leader>b', group = '[B]uffers' },
      { '<leader>b_', hidden = true },
      { '<leader>f', group = '[F]ind' },
      { '<leader>f_', hidden = true },
      { '<leader>g', group = '[G]it' },
      { '<leader>g_', hidden = true },
      { '<leader>h', group = '[H]ttp' },
      { '<leader>h_', hidden = true },
      { '<leader>l', group = '[L]sp' },
      { '<leader>l_', hidden = true },
      { '<leader>m', group = '[M]isc' },
      { '<leader>m_', hidden = true },
      { '<leader>ml', group = '[L]aravel' },
      { '<leader>ml_', hidden = true },
      { '<leader>mt', group = '[T]ypescript' },
      { '<leader>mt_', hidden = true },
      { '<leader>n', group = '[N]otes' },
      { '<leader>n_', hidden = true },
      { '<leader>s', group = '[S]earch' },
      { '<leader>s_', hidden = true },
      { '<leader>t', group = '[T]abs' },
      { '<leader>t_', hidden = true },
      { '<leader>x', group = 'Trouble' },
      { '<leader>x_', hidden = true },
      { '<leader>u', group = '[U]i' },
      { '<leader>u_', hidden = true },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>w_', hidden = true },
    }
  end,
}
