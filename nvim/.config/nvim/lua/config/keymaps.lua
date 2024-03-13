-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

map("n", "gQ", "@qj", { desc = "Macro on new line", remap = true, silent = true, expr = true })
map("x", "gQ", ":norm @q", { desc = "Macto on selection", remap = true, silent = true, expr = true })
