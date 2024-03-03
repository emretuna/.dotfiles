return {
  "telescope.nvim",
  dependencies = {

    "ahmedkhalf/project.nvim",
    build = "make",
    keys = {
      { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
    },
    opts = {
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },

      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      show_hidden = false,
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("projects")
      end)
    end,
  },
}
