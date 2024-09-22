return {
  'AckslD/nvim-neoclip.lua',
  dependencies = { 'ibhagwan/fzf-lua', { 'kkharji/sqlite.lua', module = 'sqlite' } },
  event = 'VeryLazy',
  opts = {
    enable_persistent_history = true,
    fzf = {
      select = 'default',
      paste = 'ctrl-p',
      paste_behind = 'ctrl-k',
      custom = {},
    },
  },
  config = function(_, opts)
    require('neoclip').setup(opts)
  end,
}
