return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'echasnovski/mini.icons' },
  opts = function()
    local actions = require('fzf-lua').actions

    local img_previewer ---@type string[]?
    for _, v in ipairs {
      { cmd = 'ueberzug', args = {} },
      { cmd = 'chafa', args = { '{file}', '--format=symbols' } },
      { cmd = 'viu', args = { '-b' } },
    } do
      if vim.fn.executable(v.cmd) == 1 then
        img_previewer = vim.list_extend({ v.cmd }, v.args)
        break
      end
    end
    return {
      fzf_colors = {
        bg = { 'bg', 'Normal' },
        gutter = { 'bg', 'Normal' },
        info = { 'fg', 'Conditional' },
        scrollbar = { 'bg', 'Normal' },
        separator = { 'fg', 'Comment' },
      },
      fzf_opts = {
        ['--info'] = 'default',
        ['--layout'] = 'reverse-list',
        ['--no-scrollbar'] = true,
      },
      defaults = {
        -- formatter = 'path.filename_first',
        formatter = 'path.dirname_first',
      },
      previewers = {
        builtin = {
          extensions = {
            ['png'] = img_previewer,
            ['jpg'] = img_previewer,
            ['jpeg'] = img_previewer,
            ['gif'] = img_previewer,
            ['webp'] = img_previewer,
          },
          ueberzug_scaler = 'fit_contain',
        },
      },
      winopts = {
        default = 'bat_native',
        width = 0.80,
        height = 0.70,
        preview = {
          scrollbar = false,
          vertical = 'up:40%',
          layout = 'vertical',
        },
      },
    }
  end,
  config = function(_, opts)
    -- calling `setup` is optional for customization
    require('fzf-lua').setup(opts)
    local fzf_lua = require 'fzf-lua'

    vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<cr>', { desc = '[F]iles' })
    vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua help_tags<cr>', { desc = '[F]ind [H]elp' })
    vim.keymap.set('n', '<leader>fc', '<cmd>FzfLua command_history<cr>', { desc = '[F]ind [C]ommand History' })

    vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua git_files<cr>', { desc = '[F]ind [G]it Files' })
    vim.keymap.set('n', '<leader>fr', '<cmd>FzfLua resume<cr>', { desc = '[F]ind [R]esume' })
    vim.keymap.set('n', '<leader>fm', '<cmd>FzfLua marks<cr>', { desc = '[F]ind [M]arks' })
    vim.keymap.set('n', '<leader>fo', '<cmd>FzfLua oldfiles<cr>', { desc = '[F]ind [O]ldfiles' })
    vim.keymap.set('n', '<leader>fw', '<cmd>FzfLua grep_cword<cr>', { desc = '[F]ind current [W]ord' })
    vim.keymap.set('v', '<leader>fw', '<cmd>FzfLua grep_visual<cr>', { desc = '[F]ind current [W]ord' })
    vim.keymap.set('n', '<leader>fk', '<cmd>FzfLua keymaps<cr>', { desc = '[F]ind [K]eymaps' })
    vim.keymap.set('n', '<leader>fs', '<cmd>FzfLua builtin<cr>', { desc = '[F]ind [S]elect Builtin' })

    vim.keymap.set('n', '<leader>f/', '<cmd>FzfLua live_grep<cr>', { desc = '[F]ind Grep' })
    vim.keymap.set('n', '<leader>f.', '<cmd>FzfLua oldfiles cwd=~<cr>', { desc = '[F]ind Recent Files ("." for repeat)' })

    -- Lsp keymaps
    vim.keymap.set('n', 'ga', '<cmd>FzfLua lsp_code_actions<cr>', { desc = 'LSP: [A]ctions' })
    vim.keymap.set('n', 'gR', '<cmd>FzfLua lsp_references<cr>', { desc = 'LSP: [R]eferences' })
    vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<cr>', { desc = 'LSP: [D]efinitions' })
    vim.keymap.set('n', 'gD', '<cmd>FzfLua lsp_declarations<cr>', { desc = 'LSP: [D]eclarations' })
    vim.keymap.set('n', 'gt', '<cmd>FzfLua lsp_typedefs<cr>', { desc = 'LSP: [T]ype [D]efinitions' })

    vim.keymap.set('n', '<leader>li', '<cmd>FzfLua lsp_implementations<cr>', { desc = 'LSP: [I]mplementations' })
    vim.keymap.set('n', '<leader>ls', '<cmd>FzfLua lsp_document_symbols<cr>', { desc = 'LSP: [S]ymbols' })
    vim.keymap.set('n', '<leader>lS', '<cmd>FzfLua lsp_workspace_symbols<cr>', { desc = 'LSP: Workspace [S]ymbols' })
    vim.keymap.set('n', '<leader>lx', '<cmd>FzfLua lsp_diagnostics_document<cr>', { desc = 'LSP: Diagnostics Document' })
    vim.keymap.set('n', '<leader>lX', '<cmd>FzfLua lsp_diagnostics_workspace<cr>', { desc = 'LSP: Diagnostics Workspace' })
    vim.keymap.set('n', '<leader>l/', '<cmd>FzfLua lsp_live_workspace_symbols<cr>', { desc = 'LSP: Live Workspace Symbols' })
    vim.keymap.set('n', '<leader>l.', '<cmd>FzfLua lsp_finder<cr>', { desc = 'LSP: All LSP Locations' })

    vim.keymap.set('n', '<leader>b.', '<cmd>FzfLua buffers<cr>', { desc = '[B]uffers' })

    vim.keymap.set('n', '<leader>t.', '<cmd>FzfLua tabs<cr>', { desc = '[T]abs' })
    -- neoclip.nvim keymap
    vim.keymap.set('n', '<leader>fy', '<cmd>:lua require("neoclip.fzf")()<cr>', { desc = '[F]ind [Y]ank History' })
    -- Add keymap for project.nvim
    vim.keymap.set('n', '<leader>fp', function()
      local history = require 'project_nvim.utils.history'
      fzf_lua.fzf_exec(function(cb)
        local results = history.get_recent_projects()
        for _, e in ipairs(results) do
          cb(e)
        end
        cb()
      end, {
        actions = {
          ['default'] = {
            function(selected)
              fzf_lua.files { cwd = selected[1] }
            end,
          },
          ['ctrl-d'] = {
            function(selected)
              history.delete_project { value = selected[1] }
            end,
            fzf_lua.actions.resume,
          },
        },
      })
    end, { desc = '[F]ind [P]roject' })
    -- Neovim config
    vim.keymap.set('n', '<leader>fn', function()
      -- specify vimconfig directory
      local choice = '~/.config/nvim'
      require('fzf-lua').files {
        prompt = 'NvimConfig » ',
        cwd = choice,
      }
      vim.cmd('chdir ' .. choice)
    end, { desc = '[F]ind [N]vim Config' })
    -- Dotfiles config
    vim.keymap.set('n', '<leader>fd', function()
      -- specify vimconfig directory
      local choice = '~/.dotfiles'
      require('fzf-lua').files {
        prompt = 'DotFiles » ',
        cwd = choice,
      }
      vim.cmd('chdir ' .. choice)
    end, { desc = '[F]ind [D]otfiles' })
  end,
}