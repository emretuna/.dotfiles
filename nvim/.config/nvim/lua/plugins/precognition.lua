return {
  'tris203/precognition.nvim',
  event = 'VeryLazy',
  config = function()
    require('precognition').setup()
  end,
}
