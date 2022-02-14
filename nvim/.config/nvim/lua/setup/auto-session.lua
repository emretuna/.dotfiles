require('auto-session').setup {
      log_level = 'info',
      auto_session_enable_last_session=false,
      auto_session_suppress_dirs = {'~/', '~/Code'}
    }
