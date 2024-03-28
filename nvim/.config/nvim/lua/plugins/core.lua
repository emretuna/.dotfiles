-- Core behaviors
-- Things that add new behaviors.

--    Sections:
--       -> project.nvim           [project search + auto cd]
--       -> trim.nvim              [auto trim spaces]
--       -> stickybuf.nvim         [lock special buffers]
--       -> mini.bufremove         [smart bufdelete]
--       -> smart-splits           [move and resize buffers]
--       -> better-scape.nvim      [esc]
--       -> toggleterm.nvim        [term]
--       -> session-manager        [session]
--       -> spectre.nvim           [search and replace in project]
--       -> neotree file browser   [neotree]
--       -> nvim-ufo               [folding mod]
--       -> nvim-neoclip           [nvim clipboard]
--       -> zen-mode.nvim          [distraction free mode]
--       -> suda.vim               [write as sudo]
--       -> vim-matchup            [Improved % motion]
--       -> hop.nvim               [go to word visually]
--       -> nvim-autopairs         [auto close brackets]
--       -> lsp_signature.nvim     [auto params help]

return {
  -- project.nvim [project search + auto cd]
  -- https://github.com/ahmedkhalf/project.nvim
  {
    "Zeioth/project.nvim",
    event = "User BaseDefered",
    cmd = "ProjectRoot",
    opts = {
      -- How to find root directory
      patterns = {
        ".git",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",
        "package.json",
        ".solution",
        ".solution.toml"
      },
      -- Don't list the next projects
      exclude_dirs = {
        "~/"
      },
      silent_chdir = true,
      manual_mode = false,

      -- Don't auto-chdir for specific filetypes.
      exclude_filetype_chdir = { "", "OverseerList", "alpha" },

      -- Don't auto-chdir for specific buftypes.
      exclude_buftype_chdir = { "nofile", "terminal" },

      --ignore_lsp = { "lua_ls" },
    },
    config = function(_, opts) require("project_nvim").setup(opts) end,
  },

  -- trim.nvim [auto trim spaces]
  -- https://github.com/cappyzawa/trim.nvim
  {
    "cappyzawa/trim.nvim",
    event = "BufWrite",
    opts = {
      ft_blocklist = { "typescript" },
      trim_on_write = true,
      trim_trailing = true,
      trim_last_line = false,
      trim_first_line = false,
      -- patterns = {[[%s/\(\n\n\)\n\+/\1/]]}, -- Only one consecutive bl
    },
  },

  -- stickybuf.nvim [lock special buffers]
  -- https://github.com/arnamak/stay-centered.nvim
  -- By default it support neovim/aerial and others.
  {
    "stevearc/stickybuf.nvim",
    event = "User BaseDefered",
    config = function() require("stickybuf").setup() end
  },

  -- mini.bufremove [smart bufdelete]
  -- https://github.com/echasnovski/mini.bufremove
  -- Defines what tab to go on :bufdelete
  {
    "echasnovski/mini.bufremove",
    event = "User BaseFile"
  },

  --  smart-splits [move and resize buffers]
  --  https://github.com/mrjones2014/smart-splits.nvim
  {
    "mrjones2014/smart-splits.nvim",
    event = "User BaseFile",
    opts = {
      ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
      ignored_buftypes = { "nofile" },
    },
  },

  -- better-scape.nvim [esc]
  -- https://github.com/max397574/better-escape.nvim
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = {
      mapping = {},
      timeout = 300,
    },
  },

  -- Toggle floating terminal on <F7> [term]
  -- https://github.com/akinsho/toggleterm.nvim
  -- neovim bug → https://github.com/neovim/neovim/issues/21106
  -- workarounds → https://github.com/akinsho/toggleterm.nvim/wiki/Mouse-support
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      highlights = {
        Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
        NormalFloat = { link = "Normal" },
        FloatBorder = { link = "FloatBorder" },
        StatusLine = { link = "StatusLine" },
        StatusLineNC = { link = "StatusLineNC" },
        WinBar = { link = "WinBar" },
        WinBarNC = { link = "WinBarNC" },
      },
      size = 10,
      open_mapping = [[<F7>]],
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "rounded",
        highlights = { border = "Normal", background = "Normal" },
      },
    },
  },

  -- session-manager [session]
  -- https://github.com/Shatur/neovim-session-manager
  {
    "Shatur/neovim-session-manager",
    event = "User BaseDefered",
    cmd = "SessionManager",
    opts = function()
      local config = require('session_manager.config')
      return {
        autoload_mode = config.AutoloadMode.Disabled,
        autosave_last_session = false,
        autosave_only_in_session = false,
      }
    end,
    config = function(_, opts)
      local session_manager = require('session_manager')
      session_manager.setup(opts)

      -- Auto save session
      -- BUG: This feature will auto-close anything nofile before saving.
      --      This include neotree, aerial, mergetool, among others.
      --      Consider commenting the next block if this is important for you.
      --
      --      This won't be necessary once neovim fixes:
      --      https://github.com/neovim/neovim/issues/12242
      -- vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
      --   callback = function ()
      --     session_manager.save_current_session()
      --   end
      -- })
    end
  },

  -- spectre.nvim [search and replace in project]
  -- https://github.com/nvim-pack/nvim-spectre
  -- INSTRUCTIONS:
  -- To see the instructions press '?'
  -- To start the search press <ESC>.
  -- It doesn't have ctrl-z so please always commit before using it.
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = {
      default = {
        find = {
          -- pick one of item in find_engine [ fd, rg ]
          cmd = "fd",
          options = {}
        },
        replace = {
          -- pick one of item in [ sed, oxi ]
          cmd = "sed"
        },
      },
      is_insert_mode = true,    -- start open panel on is_insert_mode
      is_block_ui_break = true, -- prevent the UI from breaking
      mapping = {
        ["toggle_line"] = {
          map = "d",
          cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
          desc = "toggle item.",
        },
        ["enter_file"] = {
          map = "<cr>",
          cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
          desc = "open file.",
        },
        ["send_to_qf"] = {
          map = "sqf",
          cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
          desc = "send all items to quickfix.",
        },
        ["replace_cmd"] = {
          map = "src",
          cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
          desc = "replace command.",
        },
        ["show_option_menu"] = {
          map = "so",
          cmd = "<cmd>lua require('spectre').show_options()<CR>",
          desc = "show options.",
        },
        ["run_current_replace"] = {
          map = "c",
          cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
          desc = "confirm item.",
        },
        ["run_replace"] = {
          map = "R",
          cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
          desc = "replace all.",
        },
        ["change_view_mode"] = {
          map = "sv",
          cmd = "<cmd>lua require('spectre').change_view()<CR>",
          desc = "results view mode.",
        },
        ["change_replace_sed"] = {
          map = "srs",
          cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
          desc = "use sed to replace.",
        },
        ["change_replace_oxi"] = {
          map = "sro",
          cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
          desc = "use oxi to replace.",
        },
        ["toggle_live_update"] = {
          map = "sar",
          cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
          desc = "auto refresh changes when nvim writes a file.",
        },
        ["resume_last_search"] = {
          map = "sl",
          cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
          desc = "repeat last search.",
        },
        ["insert_qwerty"] = {
          map = "i",
          cmd = "<cmd>startinsert<CR>",
          desc = "insert (qwerty).",
        },
        ["insert_colemak"] = {
          map = "o",
          cmd = "<cmd>startinsert<CR>",
          desc = "insert (colemak).",
        },
        ["quit"] = {
          map = "q",
          cmd = "<cmd>lua require('spectre').close()<CR>",
          desc = "quit.",
        },
      },
    },
  },

  -- [neotree]
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    cmd = "Neotree",
    opts = function()
      vim.g.neo_tree_remove_legacy_commands = true
      local utils = require "base.utils"
      local get_icon = utils.get_icon
      return {
        auto_clean_after_session_restore = true,
        close_if_last_window = true,
        buffers = {
          show_unloaded = true
        },
        sources = { "filesystem", "buffers", "git_status" },
        source_selector = {
          winbar = true,
          statusline = false,
          content_layout = "center",
          sources = {
            {
              source = "filesystem",
              display_name = get_icon("FolderClosed", 1, true) .. "File",
            },
            {
              source = "buffers",
              display_name = get_icon("DefaultFile", 1, true) .. "Bufs",
            },
            {
              source = "git_status",
              display_name = get_icon("Git", 1, true) .. "Git",
            },
            {
              source = "diagnostics",
              display_name = get_icon("Diagnostic", 1, true) .. "Diagnostic",
            },
          },
        },
        default_component_configs = {
          indent = { padding = 0 },
          icon = {
            folder_closed = get_icon("FolderClosed"),
            folder_open = get_icon("FolderOpen"),
            folder_empty = get_icon("FolderEmpty"),
            folder_empty_open = get_icon("FolderEmpty"),
            default = get_icon "DefaultFile",
          },
          modified = { symbol = get_icon "FileModified" },
          git_status = {
            symbols = {
              added = get_icon("GitAdd"),
              deleted = get_icon("GitDelete"),
              modified = get_icon("GitChange"),
              renamed = get_icon("GitRenamed"),
              untracked = get_icon("GitUntracked"),
              ignored = get_icon("GitIgnored"),
              unstaged = get_icon("GitUnstaged"),
              staged = get_icon("GitStaged"),
              conflict = get_icon("GitConflict"),
            },
          },
        },
        -- A command is a function that we can assign to a mapping (below)
        commands = {
          system_open = function(state)
            require("base.utils").open_with_program(state.tree:get_node():get_id())
          end,
          parent_or_close = function(state)
            local node = state.tree:get_node()
            if
                (node.type == "directory" or node:has_children())
                and node:is_expanded()
            then
              state.commands.toggle_node(state)
            else
              require("neo-tree.ui.renderer").focus_node(
                state,
                node:get_parent_id()
              )
            end
          end,
          child_or_open = function(state)
            local node = state.tree:get_node()
            if node.type == "directory" or node:has_children() then
              if not node:is_expanded() then -- if unexpanded, expand
                state.commands.toggle_node(state)
              else                           -- if expanded and has children, seleect the next child
                require("neo-tree.ui.renderer").focus_node(
                  state,
                  node:get_child_ids()[1]
                )
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
              e = { val = modify(filename, ":e"), msg = "Extension only" },
              f = { val = filename, msg = "Filename" },
              F = {
                val = modify(filename, ":r"),
                msg = "Filename w/o extension",
              },
              h = {
                val = modify(filepath, ":~"),
                msg = "Path relative to Home",
              },
              p = {
                val = modify(filepath, ":."),
                msg = "Path relative to CWD",
              },
              P = { val = filepath, msg = "Absolute path" },
            }

            local messages = {
              { "\nChoose to copy to clipboard:\n", "Normal" },
            }
            for i, result in pairs(results) do
              if result.val and result.val ~= "" then
                vim.list_extend(messages, {
                  { ("%s."):format(i),           "Identifier" },
                  { (" %s: "):format(result.msg) },
                  { result.val,                  "String" },
                  { "\n" },
                })
              end
            end
            vim.api.nvim_echo(messages, false, {})
            local result = results[vim.fn.getcharstr()]
            if result and result.val and result.val ~= "" then
              vim.notify("Copied: " .. result.val)
              vim.fn.setreg("+", result.val)
            end
          end,
          find_in_dir = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require("telescope.builtin").find_files {
              cwd = node.type == "directory" and path
                  or vim.fn.fnamemodify(path, ":h"),
            }
          end,
        },
        window = {
          width = 30,
          mappings = {
            ["<space>"] = false, -- disable space until we figure out which-key disabling
            ["<S-CR>"] = "system_open",
            ["[b"] = "prev_source",
            ["]b"] = "next_source",
            F = utils.is_available "telescope.nvim" and "find_in_dir" or nil,
            O = "system_open",
            Y = "copy_selector",
            h = "parent_or_close",
            l = "child_or_open",
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,
          commands = {
            -- Trash the target
            delete = function(state)
              local cmds = require("neo-tree.sources.manager")
              local inputs = require("neo-tree.ui.inputs")
              local tree = state.tree
              local node = tree:get_node()
              if node.type == "message" then
                return
              end
              local _, name = require("neo-tree.utils").split_path(node.path)
              local msg = string.format("Are you sure you want to trash '%s'?", name)
              inputs.confirm(msg, function(confirmed)
                if not confirmed then
                  return
                end
                vim.api.nvim_command("silent !trash -f " .. node.path)
                cmds.refresh(state)
              end)
            end,

            -- Trash the selections (visual mode)
            delete_visual = function(state, selected_nodes)
              local cmds = require("neo-tree.sources.manager")
              local inputs = require("neo-tree.ui.inputs")
              local paths_to_trash = {}
              for _, node in ipairs(selected_nodes) do
                if node.type ~= 'message' then
                  table.insert(paths_to_trash, node.path)
                end
              end
              local msg = "Are you sure you want to trash " .. #paths_to_trash .. " items?"
              inputs.confirm(msg, function(confirmed)
                if not confirmed then
                  return
                end
                for _, path in ipairs(paths_to_trash) do
                  vim.api.nvim_command("silent !trash -f " .. path)
                end
                cmds.refresh(state)
              end)
            end,
          }
        },
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function(_) vim.opt_local.signcolumn = "auto" end,
          },
        },
      }
    end,
  },

  --  code [folding mod] + [promise-asyn] dependency
  --  https://github.com/kevinhwang91/nvim-ufo
  --  https://github.com/kevinhwang91/promise-async
  {
    "kevinhwang91/nvim-ufo",
    event = { "User BaseFile" },
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      preview = {
        mappings = {
          scrollB = "<C-b>",
          scrollF = "<C-f>",
          scrollU = "<C-u>",
          scrollD = "<C-d>",
        },
      },
      provider_selector = function(_, filetype, buftype)
        local function handleFallbackException(bufnr, err, providerName)
          if type(err) == "string" and err:match "UfoFallbackException" then
            return require("ufo").getFolds(bufnr, providerName)
          else
            return require("promise").reject(err)
          end
        end

        -- only use indent until a file is opened
        return (filetype == "" or buftype == "nofile") and "indent"
            or function(bufnr)
              return require("ufo")
                  .getFolds(bufnr, "lsp")
                  :catch(
                    function(err)
                      return handleFallbackException(bufnr, err, "treesitter")
                    end
                  )
                  :catch(
                    function(err)
                      return handleFallbackException(bufnr, err, "indent")
                    end
                  )
            end
      end,
    },
  },

  --  nvim-neoclip [nvim clipboard]
  --  https://github.com/AckslD/nvim-neoclip.lua
  --  Read their docs to enable cross-session history.
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {'nvim-telescope/telescope.nvim',{'kkharji/sqlite.lua', module = 'sqlite'}},
    event = "User BaseFile",
    opts = {
      enable_persistent_history = true,
    }
  },

  --  zen-mode.nvim [distraction free mode]
  --  https://github.com/folke/zen-mode.nvim
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
  },

  --  suda.nvim [write as sudo]
  --  https://github.com/lambdalisue/suda.vim
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
  },

  --  vim-matchup [improved % motion]
  --  https://github.com/andymass/vim-matchup
  {
    "andymass/vim-matchup",
    event = "User BaseFile",
    config = function()
      vim.g.matchup_matchparen_deferred = 1   -- work async
      vim.g.matchup_matchparen_offscreen = {} -- disable status bar icon
    end,
  },

  --  hop.nvim [go to word visually]
  --  https://github.com/smoka7/hop.nvim
  {
    "smoka7/hop.nvim",
    cmd = { "HopWord" },
    opts = { keys = "etovxqpdygfblzhckisuran" }
  },

  --  nvim-autopairs [auto close brackets]
  --  https://github.com/windwp/nvim-autopairs
  --  It's disabled by default, you can enable it with <space>ua
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = { java = false },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    },
    config = function(_, opts)
      local npairs = require "nvim-autopairs"
      npairs.setup(opts)
      if not vim.g.autopairs_enabled then npairs.disable() end

      local is_cmp_loaded, cmp = pcall(require, "cmp")
      if is_cmp_loaded then
        cmp.event:on(
          "confirm_done",
          require("nvim-autopairs.completion.cmp").on_confirm_done {
            tex = false }
        )
      end
    end
  },

  -- lsp_signature.nvim [auto params help]
  -- https://github.com/ray-x/lsp_signature.nvim
  {
    "ray-x/lsp_signature.nvim",
    event = "User BaseFile",
    opts = function()
      -- Apply globals from options.lua
      local is_enabled = vim.g.lsp_signature_enabled
      local round_borders = {}
      if vim.g.lsp_round_borders_enabled then
        round_borders = { border = 'rounded' }
      end
      return {
        -- Window mode
        floating_window = is_enabled, -- Display it as floating window.
        hi_parameter = "IncSearch",   -- Color to highlight floating window.
        handler_opts = round_borders, -- Window style

        -- Hint mode
        hint_enable = false, -- Display it as hint.
        hint_prefix = "👈 ",

        -- Additionally, you can use <space>ui to toggle inlay hints.
        toggle_key_flip_floatwin_setting = is_enabled
      }
    end,
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
} -- end of return
