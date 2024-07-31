return {
  'AckslD/nvim-neoclip.lua',
  dependencies = { 'nvim-telescope/telescope.nvim', { 'kkharji/sqlite.lua', module = 'sqlite' } },
  event = 'VeryLazy',
  opts = {
    enable_persistent_history = true,
  },
}
