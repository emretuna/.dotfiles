return {
  "jackMort/ChatGPT.nvim",
  config = function()
    require("chatgpt").setup({
      -- optional configuration
    })
  end,
  requires = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
