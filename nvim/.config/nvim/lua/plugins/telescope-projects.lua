return {
  "telescope.nvim",
  dependencies = {
    "ahmedkhalf/project.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("projects")
    end,
  },
}
