return {
  "telescope.nvim",
  dependencies = {
    "ahmedkhalf/project.nvim",
    build = "make",
    config = function()
      require("project_nvim").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        patterns = {
          ".git",
          "package.json",
          ".terraform",
          "go.mod",
          "requirements.yml",
          "pyrightconfig.json",
          "pyproject.toml",
        },
        -- detection_methods = { "lsp", "pattern" },
        detection_methods = { "pattern" },
      })

      require("telescope").load_extension("projects")
    end,
  },
}
