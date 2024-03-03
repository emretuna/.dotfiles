return {
  "telescope.nvim",
  dependencies = {
    "xiyaowong/telescope-emoji.nvim",
    build = "make",
    keys = {
      { "<leader>fe", "<Cmd>:Telescope emoji<CR>", desc = "Telescope Emoji" },
    },
    config = function()
      require("telescope").load_extension("emoji")
    end,
  },
}
