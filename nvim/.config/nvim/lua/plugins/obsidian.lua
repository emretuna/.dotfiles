return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = function()
    return {
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
      ui = { enable = false },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- create and toggle checkboxes no need for now, will use below mapping
        -- ['<leader>ch'] = {
        --   action = function()
        --     local line = vim.api.nvim_get_current_line()
        --     if line:match '%s*- %[' then
        --       require('obsidian').util.toggle_checkbox()
        --     elseif line:match '%s*-' then
        --       vim.cmd [[s/-/- [ ]/]]
        --       vim.cmd.nohlsearch()
        --     end
        --   end,
        --   opts = { buffer = true },
        -- },
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
  end,
  config = function(_, opts)
    require('obsidian').setup(opts)
    vim.opt.conceallevel = 1

    -- Obsidian Daily
    vim.keymap.set('n', '<leader>nd', ':ObsidianToday<cr>', { desc = 'Daily' })
    -- Obsidian Tomorrow
    vim.keymap.set('n', '<leader>nt', ':ObsidianToday 1<cr>', { desc = 'Tomorrow' })
    -- Obsidian Yesterday
    vim.keymap.set('n', '<leader>ny', ':ObsidianToday -1<cr>', { desc = 'Yesterday' })
    -- Obsidian Backlinks
    vim.keymap.set('n', '<leader>nb', ':ObsidianBacklinks<cr>', { desc = 'Backlinks' })
    -- Obsidian Link Selection
    vim.keymap.set('n', '<leader>nl', ':ObsidianLink<cr>', { desc = 'Link Selection' })
    -- Obsidian Follow Link
    vim.keymap.set('n', '<leader>nf', ':ObsidianFollowLink<cr>', { desc = 'Follow Link' })
    -- Obsidian New
    vim.keymap.set('n', '<leader>nn', ':ObsidianNew<cr>', { desc = 'New' })
    -- Obsidian Search
    vim.keymap.set('n', '<leader>ns', ':ObsidianSearch<cr>', { desc = 'Search' })
    -- Obsidian Open Quickswitch
    vim.keymap.set('n', '<leader>n.', ':ObsidianQuickSwitch<cr>', { desc = 'Quickswitch' })
    -- Obsidian Open In App
    vim.keymap.set('n', '<leader>no', ':ObsidianOpen<cr>', { desc = 'Open In App' })
  end,
}
