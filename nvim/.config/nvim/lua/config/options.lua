-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.big_file = { size = 1024 * 100, lines = 10000 } -- For files bigger than this, disable 'treesitter' (+100kb).
-- Enable lsp rounded borders
vim.g.lsp_round_borders_enabled = true
-- Enable cmp rounded borders
vim.g.completion_round_borders_enabled = true

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Disable some plugins to reduce startup time
vim.g.dap_enabled = false
vim.g.dadbod_enabled = false
vim.g.precognition_enabled = false
vim.g.neotest_enabled = false
-- If more than 1 show tabline
vim.opt.showtabline = 1
-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Number of space in a tab.
vim.opt.tabstop = 2
-- Number of space inserted for indentation.
vim.opt.shiftwidth = 2

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Misc Settings
vim.opt.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example! To disable set it to " "
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI.
vim.opt.timeoutlen = 500 -- Shorten key timeout length a little bit for which-key.
vim.opt.undofile = true -- Enable persistent undo between session and reboots.
vim.opt.updatetime = 300 -- Length of time to wait before triggering the plugin.
vim.opt.virtualedit = 'block' -- Allow going past end of line in visual block mode.
vim.opt.writebackup = false -- Disable making a backup before overwriting a file.
vim.opt.shada = "!,'1000,<50,s10,h" -- Remember the last 1000 opened files
vim.opt.undodir = vim.fn.stdpath 'data' .. '/undodir' -- Chooses where to store the undodir.
vim.opt.history = 1000 -- Number of commands to remember in a history table (per buffer).
vim.opt.swapfile = false -- Ask what state to recover when opening a file that was not saved.
vim.opt.wrap = true -- Disable wrapping of lines longer than the width of window.
vim.opt.colorcolumn = '80' -- PEP8 like character limit vertical bar.
-- vim.opt.mousescroll = 'ver:2,hor:5' -- Disables hozirontal scroll in neovim.
vim.opt.guicursor = 'n:blinkon200,i-ci-ve:ver25' -- Enable cursor blink.
vim.opt.autochdir = true -- Use current file dir as working dir (See project.nvim).
vim.opt.scrolloff = 10 -- Number of lines to leave before/after the cursor when scrolling. Setting a high value keep the cursor centered.
vim.opt.sidescrolloff = 10 -- Same but for side scrolling.
vim.opt.selection = 'old' -- Don't select the newline symbol when using <End> on visual mode.

-- vim: ts=2 sts=2 sw=2 et
