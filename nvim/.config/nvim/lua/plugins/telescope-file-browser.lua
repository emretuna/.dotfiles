return {
  "telescope.nvim",
  dependencies = {

    "nvim-telescope/telescope-file-browser.nvim",
    build = "make",
    keys = {
      { "<leader>fM", "<Cmd>:Telescope file_browser<CR>", desc = "File Browser" },
      { "<leader>fm", "<Cmd>:Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "File Browser (cwd)" },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          file_browser = {
            hijack_netrw = true,
            hidden = { file_browser = true, folder_browser = true },
            no_ignore = false, --false: see gitignore files, true to ignore them
            grouped = true, -- Group directories first
          },
        },
      })
      require("telescope").load_extension("file_browser")
    end,
  },
}
