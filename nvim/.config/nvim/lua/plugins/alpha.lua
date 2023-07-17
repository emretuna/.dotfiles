return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local logo = [[
       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
       ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
       ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
       ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
       ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
       ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
                          [@emretuna]
    ]]
    opts.section.header.val = vim.split(logo, "\n")

    opts.section.buttons.val = {
      opts.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      opts.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      opts.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      opts.button("p", " " .. " Projects", ":Telescope projects <CR>"),
      opts.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
      opts.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      opts.button("s", "󰑓 " .. " Restore Session", [[:lua require("persistence").load() <CR>]]),
      opts.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      opts.button("q", " " .. " Quit", ":qa<CR>"),
    }
  end,
}
