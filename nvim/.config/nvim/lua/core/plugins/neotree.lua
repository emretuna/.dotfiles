return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  cmd = 'Neotree',
  enabled = false,
  config = function()
    local opts = {
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      buffers = {
        show_unloaded = true,
      },
      sources = { 'filesystem', 'buffers', 'git_status' },
      source_selector = {
        winbar = false,
        statusline = false,
        content_layout = 'center',
        sources = {
          {
            source = 'filesystem',
          },
          {
            source = 'buffers',
          },
          {
            source = 'git_status',
          },
          {
            source = 'diagnostics',
          },
        },
      },
      -- A command is a function that we can assign to a mapping (below)
      commands = {
        parent_or_close = function(state)
          local node = state.tree:get_node()
          if (node.type == 'directory' or node:has_children()) and node:is_expanded() then
            state.commands.toggle_node(state)
          else
            require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
          end
        end,
        child_or_open = function(state)
          local node = state.tree:get_node()
          if node.type == 'directory' or node:has_children() then
            if not node:is_expanded() then -- if unexpanded, expand
              state.commands.toggle_node(state)
            else -- if expanded and has children, seleect the next child
              require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
            end
          else -- if not a directory just open it
            state.commands.open(state)
          end
        end,
        copy_selector = function(state)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local filename = node.name
          local modify = vim.fn.fnamemodify

          local results = {
            e = { val = modify(filename, ':e'), msg = 'Extension only' },
            f = { val = filename, msg = 'Filename' },
            F = {
              val = modify(filename, ':r'),
              msg = 'Filename w/o extension',
            },
            h = {
              val = modify(filepath, ':~'),
              msg = 'Path relative to Home',
            },
            p = {
              val = modify(filepath, ':.'),
              msg = 'Path relative to CWD',
            },
            P = { val = filepath, msg = 'Absolute path' },
          }

          local messages = {
            { '\nChoose to copy to clipboard:\n', 'Normal' },
          }
          for i, result in pairs(results) do
            if result.val and result.val ~= '' then
              vim.list_extend(messages, {
                { ('%s.'):format(i), 'Identifier' },
                { (' %s: '):format(result.msg) },
                { result.val, 'String' },
                { '\n' },
              })
            end
          end
          vim.api.nvim_echo(messages, false, {})
          local result = results[vim.fn.getcharstr()]
          if result and result.val and result.val ~= '' then
            vim.notify('Copied: ' .. result.val)
            vim.fn.setreg('+', result.val)
          end
        end,
        find_in_dir = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          require('telescope.builtin').find_files {
            cwd = node.type == 'directory' and path or vim.fn.fnamemodify(path, ':h'),
          }
        end,
        system_open = function(state)
          local node = state.tree:get_node()
          if node and node.type == 'file' then
            local file_path = node:get_id()
            -- macOs specific -- open file in default application in the background
            vim.api.nvim_command('silent !open -g ' .. file_path)
          end
        end,
      },
      window = {
        position = 'right',
        width = 30,
        mappings = {
          ['<space>'] = false, -- disable space until we figure out which-key disabling
          ['[b'] = 'prev_source',
          [']b'] = 'next_source',
          F = 'find_in_dir',
          O = 'system_open',
          Y = 'copy_selector',
          h = 'parent_or_close',
          l = 'child_or_open',
        },
      },
      filesystem = {
        filtered_items = {
          hide_gitignored = true,
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            '.DS_Store',
            'thumbs.db',
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        hijack_netrw_behavior = 'open_current',
        use_libuv_file_watcher = true,
        commands = {
          -- Trash the target
          delete = function(state)
            local cmds = require 'neo-tree.sources.manager'
            local inputs = require 'neo-tree.ui.inputs'
            local tree = state.tree
            local node = tree:get_node()
            if node.type == 'message' then
              return
            end
            local _, name = require('neo-tree.utils').split_path(node.path)
            local msg = string.format("Are you sure you want to trash '%s'?", name)
            inputs.confirm(msg, function(confirmed)
              if not confirmed then
                return
              end
              vim.api.nvim_command('silent !trash -f ' .. node.path)
              cmds.refresh(state)
            end)
          end,

          -- Trash the selections (visual mode)
          delete_visual = function(state, selected_nodes)
            local cmds = require 'neo-tree.sources.manager'
            local inputs = require 'neo-tree.ui.inputs'
            local paths_to_trash = {}
            for _, node in ipairs(selected_nodes) do
              if node.type ~= 'message' then
                table.insert(paths_to_trash, node.path)
              end
            end
            local msg = 'Are you sure you want to trash ' .. #paths_to_trash .. ' items?'
            inputs.confirm(msg, function(confirmed)
              if not confirmed then
                return
              end
              for _, path in ipairs(paths_to_trash) do
                vim.api.nvim_command('silent !trash -f ' .. path)
              end
              cmds.refresh(state)
            end)
          end,
        },
      },
      event_handlers = {
        {
          event = 'neo_tree_buffer_enter',
          handler = function(_)
            vim.opt_local.signcolumn = 'auto'
            vim.opt_local.foldcolumn = '0'
          end,
        },
      },
    }
    require('neo-tree').setup(opts)

    vim.g.neo_tree_remove_legacy_commands = true
    vim.api.nvim_create_autocmd('TermClose', {
      pattern = { '*lazygit', '*gitui' },
      desc = 'Refresh Neo-Tree git when closing lazygit/gitui',
      callback = function()
        local manager_avail, manager = pcall(require, 'neo-tree.sources.manager')
        if manager_avail then
          for _, source in ipairs {
            'filesystem',
            'git_status',
            'document_symbols',
          } do
            local module = 'neo-tree.sources.' .. source
            if package.loaded[module] then
              manager.refresh(require(module).name)
            end
          end
        end
      end,
    })
  end,
  keys = {
    vim.keymap.set('n', '<leader>e', '<cmd>:Neotree toggle<cr>', { desc = '[E]xplorer Toggle' }),
  },
}
