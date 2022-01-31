-- Use spelling for markdown files ‘]s’ to find next, ‘[s’ for previous, 'z=‘ for suggestions when on one.
-- Source: http:--thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
-- Also I'm adding different sources for completion here, if you aren't on Mac you might need to install "look"
vim.api.nvim_exec(
  [[
augroup markdownSpell
    autocmd!
    autocmd FileType markdown,md,txt setlocal spell
    autocmd BufRead,BufNewFile *.md,*.txt,*.markdown setlocal spell
autocmd FileType markdown,md,txt lua require'cmp'.setup.buffer {
\   sources = {
\     { name = 'spell' },
\     { name = 'buffer' },
\     { name = 'look', keyword_length=3 },
\   },
\ }
augroup END
]],
  false
)
