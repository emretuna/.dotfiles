local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to space
vim.g.mapleader = " "

-- Which Key
map("n", "<leader>m", ":WhichKeyVisual<CR>", { silent = true })

-- Nvim Tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<leader>u", ":NvimTreeFindFile<CR>", { silent = true })

-- Switch Session
-- map("n", "<Leader>1", ":Telescope sessions [save_current=true]<CR>")
map("n", "<Leader>1", ":SearchSession<CR>")

-- Update Plugins
map("n", "<Leader>u", ":PackerSync<CR>")

-- Open nvimrc file
map("n", "<Leader>v", "<cmd>e $MYVIMRC<CR>")

-- Source nvimrc file
map("n", "<Leader>sv", ":luafile %<CR>")

-- Quick new file
map("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
map("n", "<Leader>sa", "ggVG<c-$>")

-- Make visual yanks place the cursor back where started
map("v", "y", "ygv<Esc>")

-- Easier file save
map("n", "<Leader>w", "<cmd>:w<CR>")
map("n", "<Delete>", "<cmd>:w<CR>")

-- Tab to switch buffers in Normal mode
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- More molecular undo of text
-- map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")
map("i", ";", ";<c-g>u")
map("i", ":", ":<c-g>u")

-- Keep search results centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Make Y yank to end of the line
map("n", "Y", "y$")

-- Line bubbling
map("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
map("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
map("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true })
map("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true })

--After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>", { silent = true })

-- Easy add date/time
map("n", "<Leader>t", "\"=strftime('%c')<CR>Pa", { silent = true })

-- Telescope

local km = vim.keymap
-- Add moves of more than 5 to the jump list
km.set("n", "j", [[(v:count > 5 ? "m'" . v:count : "") . 'j']], { expr = true, desc = "if j > 5 then add to jumplist" })
km.set("n", "<leader>p", function()
  require("telescope.builtin").find_files()
end)
km.set("n", "<leader>r", function()
  require("telescope.builtin").registers()
end)
km.set("n", "<leader>g", function()
  require("telescope.builtin").live_grep()
end)
km.set("n", "<leader>b", function()
  require("telescope.builtin").buffers()
end)
km.set("n", "<leader>j", function()
  require("telescope.builtin").help_tags()
end)
km.set("n", "<leader>h", function()
  require("telescope.builtin").git_bcommits()
end)
km.set("n", "<leader>f", function()
  require("telescope").extensions.file_browser.file_browser()
end)
km.set("n", "<leader>s", function()
  require("telescope.builtin").spell_suggest()
end)
km.set("n", "<leader>i", function()
  require("telescope.builtin").git_status()
end)
km.set("n", "<leader>ca", function()
  require("telescope.builtin").lsp_code_actions()
end)
km.set("n", "<leader>cs", function()
  require("telescope.builtin").lsp_document_symbols()
end)
km.set("n", "<leader>cd", function()
  require("telescope.builtin").lsp_document_diagnostics()
end)
km.set("n", "<leader>cr", function()
  require("telescope.builtin").lsp_references()
end)
km.set("i", "<F2>", function()
  require("renamer").rename()
end, { noremap = true, silent = true })
km.set({ "v", "n" }, "<leader>cn", function()
  require("renamer").rename()
end, { noremap = true, silent = true })
km.set("n", "<leader>ci", function()
  vim.diagnostic.open_float()
end)

-- Easier split mappings
map("n", "<Leader><Down>", "<C-W><C-J>", { silent = true })
map("n", "<Leader><Up>", "<C-W><C-K>", { silent = true })
map("n", "<Leader><Right>", "<C-W><C-L>", { silent = true })
map("n", "<Leader><Left>", "<C-W><C-H>", { silent = true })
map("n", "<Leader>;", "<C-W>R", { silent = true })
map("n", "<Leader>[", "<C-W>_", { silent = true })
map("n", "<Leader>]", "<C-W>|", { silent = true })
map("n", "<Leader>=", "<C-W>=", { silent = true })

-- Pounce
km.set({ "n", "v" }, "h", ":Pounce<CR>", { silent = true })
km.set("n", "H", ":PounceRepeat<CR>", { silent = true })

-- Symbols outline
map("n", "<leader>o", ":SymbolsOutline<cr>")

-- ZenMode toggle
map("n", "<leader>z", ":ZenMode<cr>")

-- Make Option and backspace delete whole words in OSX/Kitty. Requires `macos_option_as_alt yes` to be set in Kitty config
map("i", "<A-BS>", "<C-W>")
