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
      { '<leader>a', group = '[A]vante' },
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
      { '<leader>ll', group = '[L]aravel' },
      { '<leader>ll_', hidden = true },
      { '<leader>ln', group = '[N]ext' },
      { '<leader>ln_', hidden = true },
      { '<leader>lp', group = '[P]revious' },
      { '<leader>lp_', hidden = true },
      { '<leader>lt', group = '[T]ypescript' },
      { '<leader>lt_', hidden = true },
      { '<leader>n', group = '[N]otes' },
      { '<leader>n_', hidden = true },
      { '<leader>s', group = '[S]earch' },
      { '<leader>s_', hidden = true },
      { '<leader>t', group = '[T]rouble' },
      { '<leader>t_', hidden = true },
      { '<leader>u', group = '[U]i' },
      { '<leader>u_', hidden = true },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>w_', hidden = true },
    }
  end,
}
