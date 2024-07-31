return {
  'epwalsh/obsidian.nvim',
  ft = 'markdown',
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    'BufReadPre ' .. vim.fn.expand '~/Dev/**/*.md',
    'BufNewFile ' .. vim.fn.expand '~/Dev/**/*.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>nd', ':ObsidianToday<cr>', desc = 'Obsidian [D]aily' },
    { '<leader>nt', ':ObsidianToday 1<cr>', desc = 'Obsidian [T]omorrow' },
    { '<leader>ny', ':ObsidianToday -1<cr>', desc = 'Obsidian [Y]esterday' },
    { '<leader>nb', ':ObsidianBacklinks<cr>', desc = 'Obsidian [B]acklinks' },
    { '<leader>nl', ':ObsidianLink<cr>', desc = 'Obsidian [L]ink Selection' },
    { '<leader>nf', ':ObsidianFollowLink<cr>', desc = 'Obsidian [F]ollow Link' },
    { '<leader>nn', ':ObsidianNew<cr>', desc = 'Obsidian [N]ew' },
    { '<leader>ns', ':ObsidianSearch<cr>', desc = 'Obsidian [S]earch' },
    { '<leader>no', ':ObsidianQuickSwitch<cr>', desc = 'Obsidian [O]pen Quickswitch' },
    { '<leader>nO', ':ObsidianOpen<cr>', desc = 'Obsidian [O]pen In App' },
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('obsidian').setup {
      workspaces = {
        {
          name = 'Dev',
          path = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Dev/',
        },
        {
          name = 'Personal',
          path = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal/',
        },
      },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- create and toggle checkboxes
        ['<leader>ch'] = {
          action = function()
            local line = vim.api.nvim_get_current_line()
            if line:match '%s*- %[' then
              require('obsidian').util.toggle_checkbox()
            elseif line:match '%s*-' then
              vim.cmd [[s/-/- [ ]/]]
              vim.cmd.nohlsearch()
            end
          end,
          opts = { buffer = true },
        },
        ['<cr>'] = {
          action = function()
            return require('obsidian').util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
      -- Optional, customize how names/IDs for new notes are created.
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ''
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. '-' .. suffix
      end,
    }
    vim.opt.conceallevel = 1
  end,
}
