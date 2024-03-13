return {
  "Wansmer/treesj",
  keys = {
    {
      "<leader>m",
      desc = "Toggle split/join with treejs",
    },
    {
      "<leader>j",
      desc = "Join with treejs",
    },
    {
      "<leader>s",
      desc = "Split with treejs",
    },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({--[[ your config ]]
    })
  end,
}
