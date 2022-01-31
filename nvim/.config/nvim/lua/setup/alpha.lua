-- Dashboard
local dashboard = require("alpha.themes.dashboard")
math.randomseed(os.time())

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "Function"
  b.opts.hl_shortcut = "Type"
  return b
end

local function pick_color()
  local colors = { "String", "Identifier", "Keyword", "Number" }
  return colors[math.random(#colors)]
end

local function footer()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
  return datetime
    .. "   "
    .. total_plugins
    .. " plugins"
    .. "   v"
    .. vim.version().major
    .. "."
    .. vim.version().minor
    .. "."
    .. vim.version().patch
end

dashboard.section.header.val = {

  	[[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        
}
dashboard.section.header.opts.hl = pick_color()

dashboard.section.buttons.val = {
  button("<Leader>f", "  File Explorer"),
  button("<Leader>p", "  Find file"),
  button("<Leader>g", "  Find word"),
  button("<Leader>1", "  Open session"),
  button("<Leader>n", "  New file"),
  button("<Leader>v", "  Config"),
  button("<Leader>u", "  Update plugins"),
  button("q", "  Quit", "<Cmd>qa<CR>"),
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

require("alpha").setup(dashboard.opts)
