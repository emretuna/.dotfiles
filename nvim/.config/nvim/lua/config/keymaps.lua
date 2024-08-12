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

-- Map ScrollWheelUp to Ctrl+B
vim.api.nvim_set_keymap('n', '<ScrollWheelUp>', '<C-B>', { noremap = true })
-- Map ScrollWheelDown to Ctrl+F
vim.api.nvim_set_keymap('n', '<ScrollWheelDown>', '<C-F>', { noremap = true })

-- tabs
vim.keymap.set('n', ']t', '<cmd>tabnext<cr>', { desc = 'Tab next' })
vim.keymap.set('n', '[t', '<cmd>tabprevious<cr>', { desc = 'Tab previous' })

-- buffers
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Buffer next' })
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Buffer previous' })
vim.keymap.set('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch Buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = '[B]buffer [D]elete' })
vim.keymap.set('n', '<leader>bl', '<cmd>ls<cr>', { desc = '[B]buffer [L]ist' })
vim.keymap.set('n', '<leader>bn', '<cmd>new<cr>', { desc = '[B]buffer [N]ew' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = '[B]buffer [P]revious' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = '[B]buffer [N]ext' })
vim.keymap.set('n', '<leader>bc', function()
  vim.cmd 'execute "%bd|e#"'
end, { desc = '[B]buffer [C]lear' })
-- better indent
vim.keymap.set('x', '<Tab>', '>gv', { desc = 'Indent Line' })
vim.keymap.set('x', '<S-Tab>', '<gv', { desc = 'Unindent Line' })

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

-- Toggle spell checking
vim.keymap.set('n', '<leader>ws', function()
  vim.opt.spell = not vim.o.spell
  print('Spell checking is', (vim.o.spell and 'enabled' or 'disabled'))
end, { desc = '[S]pellcheck Toggle' })

-- terminal mappings

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Exit Terminal Mode' })
vim.keymap.set('t', '<C-h>', '<cmd>wincmd h<cr>', { desc = 'Go to Left Window' })
vim.keymap.set('t', '<C-j>', '<cmd>wincmd j<cr>', { desc = 'Go to Lower Window' })
vim.keymap.set('t', '<C-k>', '<cmd>wincmd k<cr>', { desc = 'Go to Upper Window' })
vim.keymap.set('t', '<C-l>', '<cmd>wincmd l<cr>', { desc = 'Go to Right Window' })
vim.keymap.set('t', '<C-/>', '<cmd>close<cr>', { desc = 'Hide Terminal' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
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
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Disable right contextual menu warning message',
  callback = function()
    -- Disable right click message
    vim.api.nvim_command [[aunmenu PopUp.How-to\ disable\ mouse]]
    -- vim.api.nvim_command [[aunmenu PopUp.-1-]] -- You can remode a separator like this.
    vim.api.nvim_command [[menu PopUp.Toggle\ \Breakpoint <cmd>:lua require('dap').toggle_breakpoint()<CR>]]
    vim.api.nvim_command [[menu PopUp.-2- <Nop>]]
    vim.api.nvim_command [[menu PopUp.Start\ \Debugger <cmd>:DapContinue<CR>]]
    vim.api.nvim_command [[menu PopUp.Run\ \Test <cmd>:Neotest run<CR>]]
  end,
})
-- vim: ts=2 sts=2 sw=2 et
