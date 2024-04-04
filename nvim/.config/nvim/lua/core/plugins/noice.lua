return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = function()
    local enable_conceal = true -- Hide command text if true
    local enable_lsp = true
    return {
      presets = { bottom_search = true }, -- The kind of popup used for /
      cmdline = {
        view = 'cmdline', -- The kind of popup used for :
        format = {
          cmdline = { conceal = enable_conceal },
          search_down = { conceal = enable_conceal },
          search_up = { conceal = enable_conceal },
          filter = { conceal = enable_conceal },
          lua = { conceal = enable_conceal },
          help = { conceal = enable_conceal },
          input = { conceal = enable_conceal },
        },
      },

      -- Disable every other noice feature
      messages = { enabled = enable_lsp },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
        hover = { enabled = true },
        signature = { enabled = true },
        progress = { enabled = enable_lsp },
        message = { enabled = enable_lsp },
        smart_move = { enabled = enable_lsp },
        documentation = {
          opts = {
            border = { style = 'rounded' },
            position = { row = 2 },
          },
        },
      },
    }
  end,
}
