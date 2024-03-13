return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "xiyaowong/telescope-emoji.nvim",
    {
      "ahmedkhalf/project.nvim",
      config = function(_, opts)
        require("project_nvim").setup(opts)
        require("lazyvim.util").on_load("telescope.nvim", function()
          require("telescope").load_extension("projects")
        end)
      end,
    },
  },
  keys = {
    { "<leader>fM", "<Cmd>:Telescope file_browser<CR>", desc = "File Browser" },
    { "<leader>fm", "<Cmd>:Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "File Browser (cwd)" },
    { "<leader>fe", "<Cmd>:Telescope emoji<CR>", desc = "Telescope Emoji" },
    { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
  },
  opts = {
    defaults = {
      layout_strategy = "bottom_pane",
      layout_config = { prompt_position = "bottom" },
      sorting_strategy = "ascending",
    },
    extensions = {
      file_browser = {
        hijack_netrw = true,
        hidden = { file_browser = true, folder_browser = true },
        respect_gitignore = false, --false: see gitignore files, true to ignore them
        grouped = true, -- Group directories first
      },
      projects = {
        manual_mode = false,
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        show_hidden = false,
      },
    },
  },
}
