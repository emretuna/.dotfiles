return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  cmd = 'Alpha',
  -- setup header and buttonts
  opts = function()
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      '                                                     ',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
      '                                                     ',
    }

    dashboard.section.header.opts.hl = 'DashboardHeader'
    vim.cmd 'highlight DashboardHeader guifg=#73daca'

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button('n', '📋 New     ', '<cmd>enew<CR>'),
      dashboard.button('r', '⚡ Recent  ', '<cmd>FzfLua oldfiles<CR>'),
      dashboard.button('f', '🐙 Find    ', '<cmd>FzfLua live_grep <cr>'),
      dashboard.button('l', '💤 Lazy    ', '<cmd>Lazy <cr>'),
      dashboard.button('s', '🔎 Sessions', '<cmd>SessionManager! load_session<CR>'),
      dashboard.button('p', '💼 Projects', ':lua vim.api.nvim_input("<leader>fp")<CR>'),
      dashboard.button('', ''),
      dashboard.button('q', '   Quit', '<cmd>exit<CR>'),
      --  --button("LDR f '", "  Bookmarks  "),
    }

    ---- Vertical margins
    dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.10) } -- Above header
    dashboard.config.layout[3].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.10) } -- Above buttons
    return dashboard
  end,
  config = function(_, opts)
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'AlphaReady',
        callback = function()
          require('lazy').show()
        end,
      })
    end
    -- Footer
    require('alpha').setup(opts.config)
    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      desc = 'Add Alpha dashboard footer',
      once = true,
      callback = function()
        local stats = require('lazy').stats()
        stats.real_cputime = true
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        opts.section.footer.val = {
          ' ',
          ' ',
          ' ',
          'Loaded ' .. stats.loaded .. ' plugins  in ' .. ms .. 'ms',
          '.............................',
        }
        opts.section.footer.opts.hl = 'DashboardFooter'
        vim.cmd 'highlight DashboardFooter guifg=#D29B68'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
