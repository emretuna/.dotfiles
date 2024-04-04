-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Basic keymap shortcuts
vim.keymap.set('n', '<C-s>', '<cmd>w<cr>', { desc = '[S]ave file' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move Lines
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- Shifted movement
vim.keymap.set('n', '<S-Down>', function()
  vim.api.nvim_feedkeys('7j', 'n', true)
end, {
  desc = 'Fast move down',
})
vim.keymap.set('n', '<S-Up>', function()
  vim.api.nvim_feedkeys('7k', 'n', true)
end, {
  desc = 'Fast move up',
})

-- tabs
vim.keymap.set('n', ']t', '<cmd>tabnext<cr>', { desc = 'Tab next' })
vim.keymap.set('n', '[t', '<cmd>tabprevious<cr>', { desc = 'Tab previous' })

--buffers
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Buffer next' })
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Buffer previous' })

--gitui
vim.keymap.set('n', '<leader>g.', function()
  local git_dir = vim.fn.finddir('.git', vim.fn.getcwd() .. ';')
  if git_dir ~= '' then
    if vim.fn.executable 'keychain' == 1 then
      vim.cmd 'TermExec cmd="eval `keychain --eval ~/.ssh/github.key` && gitui && exit"'
    else
      vim.cmd "TermExec cmd='gitui && exit'"
    end
  else
    vim.notify('Not a git repository', vim.log.levels.WARN)
  end
end, { desc = 'Gitui' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- q to escape window types
vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = 'Make q close help, man, quickfix, dap floats',
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value('buftype', { buf = args.buf })
    if vim.tbl_contains({ 'help', 'nofile', 'quickfix' }, buftype) then
      vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = args.buf, silent = true, nowait = true })
    end
  end,
})
vim.api.nvim_create_autocmd('CmdwinEnter', {
  desc = 'Make q close command history (q: and q?)',
  callback = function(args)
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = args.buf, silent = true, nowait = true })
  end,
})
-- vim: ts=2 sts=2 sw=2 et
