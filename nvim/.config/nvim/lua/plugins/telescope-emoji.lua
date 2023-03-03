return {
  "telescope.nvim",
  dependencies = {
    "xiyaowong/telescope-emoji.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("emoji")
    end,
  },
}
