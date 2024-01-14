return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {

    "nvim-telescope/telescope-file-browser.nvim",
    build = "make",
    keys = {
      { "<leader>fM", "<Cmd>:Telescope file_browser<CR>", desc = "File Browser" },
      { "<leader>fm", "<Cmd>:Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "File Browser (cwd)" },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
}
