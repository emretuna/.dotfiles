-- User interface
-- Things that make the GUI better.

--    Sections:
--       -> tokyonight                  [theme]
--       -> alpha-nvim                  [greeter]
--       -> nvim-notify                 [notifications]
--       -> mini.indentscope            [guides]
--       -> mini.animate                [animations]
--       -> mini.statusline             [statusline]
--       -> telescope                   [search]
--       -> telescope-fzf-native.nvim   [search backend]
--       -> smart-splits                [window-dimming]
--       -> dressing.nvim               [better ui elements]
--       -> noice.nvim                  [better cmd/search line]
--       -> nvim-web-devicons           [icons | ui]
--       -> lspkind.nvim                [icons | lsp]
--       -> highlight-undo              [highlights]
--       -> which-key                   [on-screen keybinding]

local utils = require "base.utils"
return {

  -- tokyonight [theme]
  -- https://github.com/folke/tokyonight.nvim
  {
    "Zeioth/tokyonight.nvim",
    event = "User LoadColorSchemes",
    opts = {
      dim_inactive = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    }
  },
  {
    "rebelot/kanagawa.nvim",
    event = "User LoadColorSchemes",
    opts = {

      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      dimInactive = false,
    }
  },
  --  alpha-nvim [greeter]
  --  https://github.com/goolord/alpha-nvim
  {
    "goolord/alpha-nvim",
    cmd = "Alpha",
    -- setup header and buttonts
    opts = function()
      local dashboard = require "alpha.themes.dashboard"

      dashboard.section.header.val = {
        '                                                     ',
        '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
        '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
        '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
        '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
        '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
        '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
        '                                                     ',
      }

      dashboard.section.header.opts.hl = "DashboardHeader"
      vim.cmd "highlight DashboardHeader guifg=#F7778F"

      -- Buttons
      dashboard.section.buttons.val = {
        dashboard.button("n", "📋 New     ", "<cmd>ene<CR>"),
        dashboard.button("r", "⚡ Recent  ", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("f", "🐙 Find    ", "<cmd> Telescope live_grep <cr>"),
        dashboard.button("l", "💤 Lazy    ", "<cmd> Lazy <cr>"),
        dashboard.button(
          "s",
          "🔎 Sessions",
          "<cmd>SessionManager! load_session<CR>"
        ),
        dashboard.button("p", "💼 Projects", "<cmd>Telescope projects<CR>"),
        dashboard.button("", ""),
        dashboard.button("q", "   Quit", "<cmd>exit<CR>"),
        --  --button("LDR f '", "  Bookmarks  "),
      }

      ---- Vertical margins
      dashboard.config.layout[1].val =
          vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.10) } -- Above header
      dashboard.config.layout[3].val =
          vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.10) } -- Above buttons

      -- Disable autocmd and return
      dashboard.config.opts.noautocmd = true
      return dashboard
    end,
    config = function(_, opts)
      -- Footer
      require("alpha").setup(opts.config)
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        desc = "Add Alpha dashboard footer",
        once = true,
        callback = function()
          local stats = require("lazy").stats()
          stats.real_cputime = true
          local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
          opts.section.footer.val = {
            " ",
            " ",
            " ",
            "Loaded " .. stats.loaded .. " plugins  in " .. ms .. "ms",
            ".............................",
          }
          opts.section.footer.opts.hl = "DashboardFooter"
          vim.cmd "highlight DashboardFooter guifg=#D29B68"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

  {
    "cbochs/grapple.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      scope = "git", -- also try out "git_branch"
      icons = true,  -- setting to "true" requires "nvim-web-devicons"
      status = true,
    },
    keys = {
      { ";",         "<cmd>Grapple toggle_tags<cr>",    desc = "Grapple Menu" },
      { "<leader>m", "<cmd>Grapple toggle<cr>",         desc = "Grapple Toggle" },
      { "<leader>s", "<cmd>Grapple open_scopes<cr>",    desc = "Grapple Scopes" },
      { "[g",        "<cmd>Grapple cycle forward<cr>",  desc = "Grapple Next" },
      { "]g",        "<cmd>Grapple cycle backward<cr>", desc = "Grapple Prev" },
    },
  },

  --  [notifications]
  --  https://github.com/rcarriga/nvim-notify
  {
    "rcarriga/nvim-notify",
    event = "User BaseDefered",
    opts = function()
      return {
        timeout = 2500,
        fps = 144,
        max_height = function() return math.floor(vim.o.lines * 0.75) end,
        max_width = function() return math.floor(vim.o.columns * 0.75) end,
        on_open = function(win)
          -- enable markdown support on notifications
          vim.api.nvim_win_set_config(win, { zindex = 175 })
          if not vim.g.notifications_enabled then
            vim.api.nvim_win_close(win, true)
          end
          if not package.loaded["nvim-treesitter"] then
            pcall(require, "nvim-treesitter")
          end
          vim.wo[win].conceallevel = 3
          local buf = vim.api.nvim_win_get_buf(win)
          if not pcall(vim.treesitter.start, buf, "markdown") then
            vim.bo[buf].syntax = "markdown"
          end
          vim.wo[win].spell = false
        end,
      }
    end,
    config = function(_, opts)
      local notify = require "notify"
      notify.setup(opts)
      vim.notify = notify
    end,
  },

  --  mini.indentscope [guides]
  --  https://github.com/echasnovski/mini.indentscope
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      draw = { delay = 0, animation = function() return 0 end },
      options = { border = "top", try_as_border = true },
      symbol = "▏",
    },
    config = function(_, opts)
      require("mini.indentscope").setup(opts)

      -- Disable for certain filetypes
      vim.api.nvim_create_autocmd({ "FileType" }, {
        desc = "Disable indentscope for certain filetypes",
        callback = function()
          local ignored_filetypes = {
            "aerial",
            "dashboard",
            "help",
            "lazy",
            "leetcode.nvim",
            "mason",
            "neo-tree",
            "NvimTree",
            "neogitstatus",
            "notify",
            "startify",
            "toggleterm",
            "Trouble"
          }
          if vim.tbl_contains(ignored_filetypes, vim.bo.filetype) then
            vim.b.miniindentscope_disable = true
          end
        end,
      })
    end
  },

  --  mini.animate [animations]
  --  https://github.com/echasnovski/mini.animate
  --  HINT: if one of your personal keymappings fail due to mini.animate, try to
  --        disable it during the keybinding using vim.g.minianimate_disable = true
  {
    "echasnovski/mini.animate",
    event = "User BaseFile",
    enabled = true,
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs { "Up", "Down" } do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require "mini.animate"
      return {
        open = { enable = false }, -- true causes issues on nvim-spectre
        resize = {
          timing = animate.gen_timing.linear { duration = 33, unit = "total" },
        },
        scroll = {
          timing = animate.gen_timing.linear { duration = 50, unit = "total" },
          subscroll = animate.gen_subscroll.equal {
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          },
        },
        cursor = {
          enable = false, -- We don't want cursor ghosting
          timing = animate.gen_timing.linear { duration = 26, unit = "total" },
        },
      }
    end,
  },

  -- Mini statusline
  --https://github.com/echasnovski/mini.statusline
  {
    'echasnovski/mini.statusline',
    event = "User BaseFile",
    version = '*',
    lazy = false,
    config = function()
      local MiniStatusline = require("mini.statusline")
      local blocked_filetypes = { ["neo-tree"] = true }
      require("mini.statusline").setup({
        content = {
          active = function()
            if blocked_filetypes[vim.bo.filetype] then
              vim.cmd("highlight StatusLine guibg=NONE guifg=NONE")
              return ""
            end
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git = MiniStatusline.section_git({ trunc_width = 75 })
            local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location = MiniStatusline.section_location({ trunc_width = 75 })
            local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
            local grapple = require("grapple").statusline({})

            return MiniStatusline.combine_groups({
              { hl = mode_hl,                 strings = { mode } },
              { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
              { hl = "Grapple",               strings = { grapple } },
              "%<", -- Mark general truncate point
              { hl = "MiniStatuslineFilename", strings = { filename } },
              "%=", -- End left alignment
              { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
              { hl = mode_hl,                  strings = { search, location } },
            })
          end,
        },
        use_icons = true,

        -- Whether to set Vim's settings for statusline (make it always shown with
        -- 'laststatus' set to 2). To use global statusline in Neovim>=0.7.0, set
        -- this to `false` and 'laststatus' to 3.
        set_vim_settings = false,
      })
    end,
  },


  --  Telescope [search] + [search backend] dependency
  --  https://github.com/nvim-telescope/telescope.nvim
  --  https://github.com/nvim-telescope/telescope-fzf-native.nvim
  --  https://github.com/debugloop/telescope-undo.nvim
  --  NOTE: Normally, plugins that depend on Telescope are defined separately.
  --  But its Telescope extension is added in the Telescope 'config' section.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "debugloop/telescope-undo.nvim",
        cmd = "Telescope",
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        enabled = vim.fn.executable "make" == 1,
        build = "make",
      },
    },
    cmd = "Telescope",
    opts = function()
      local get_icon = require("base.utils").get_icon
      local actions = require "telescope.actions"
      local mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<ESC>"] = actions.close,
          ["<C-c>"] = false,
        },
        n = { ["q"] = actions.close },
      }
      return {
        defaults = {
          prompt_prefix = get_icon("Selected", 1),
          selection_caret = get_icon("Selected", 1),
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.50,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = mappings,
        },
        extensions = {
          undo = {
            use_delta = true,
            side_by_side = true,
            diff_context_lines = 0,
            entry_format = "󰣜 #$ID, $STAT, $TIME",
            layout_strategy = "horizontal",
            layout_config = {
              preview_width = 0.65,
            },
            mappings = {
              i = {
                ["<cr>"] = require("telescope-undo.actions").yank_additions,
                ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                ["<C-cr>"] = require("telescope-undo.actions").restore,
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
      -- Here we define the Telescope extension for all plugins.
      -- If you delete a plugin, you can also delete its Telescope extension.
      if utils.is_available("nvim-notify") then telescope.load_extension("notify") end
      if utils.is_available("telescope-fzf-native.nvim") then telescope.load_extension("fzf") end
      if utils.is_available("telescope-undo.nvim") then telescope.load_extension("undo") end
      if utils.is_available("project.nvim") then telescope.load_extension("projects") end
      if utils.is_available("LuaSnip") then telescope.load_extension("luasnip") end
      if utils.is_available("aerial.nvim") then telescope.load_extension("aerial") end
      if utils.is_available("nvim-neoclip.lua") then
        telescope.load_extension("neoclip")
        telescope.load_extension("macroscope")
      end
    end,
  },

  --  [better ui elements]
  --  https://github.com/stevearc/dressing.nvim
  {
    "stevearc/dressing.nvim",
    event = "User BaseDefered",
    opts = {
      input = { default_prompt = "➤ " },
      select = { backend = { "telescope", "builtin" } },
    }
  },

  --  Noice.nvim [better cmd/search line]
  --  https://github.com/folke/noice.nvim
  --  We use it for:
  --  * cmdline: Display treesitter for :
  --  * search: Display a magnifier instead of /
  {
    "folke/noice.nvim",
    event = "User BaseDefered",
    opts = function()
      local enable_conceal = true -- Hide command text if true
      local enable_lsp = true
      return {
        presets = { bottom_search = true }, -- The kind of popup used for /
        cmdline = {
          view = "cmdline",                 -- The kind of popup used for :
          format = {
            cmdline = { conceal = enable_conceal },
            search_down = { conceal = enable_conceal },
            search_up = { conceal = enable_conceal },
            filter = { conceal = enable_conceal },
            lua = { conceal = enable_conceal },
            help = { conceal = enable_conceal },
            input = { conceal = enable_conceal },
          }
        },

        -- Disable every other noice feature
        messages = { enabled = enable_lsp },
        lsp = {
          hover = { enabled = false },
          signature = { enabled = false },
          progress = { enabled = enable_lsp },
          message = { enabled = enable_lsp },
          smart_move = { enabled = enable_lsp },
        },
      }
    end
  },

  --  UI icons [icons]
  --  https://github.com/nvim-tree/nvim-web-devicons
  {
    "nvim-tree/nvim-web-devicons",
    enabled = vim.g.icons_enabled,
    event = "User BaseDefered",
    opts = {
      override = {
        default_icon = {
          icon = require("base.utils").get_icon("DefaultFile"),
          name = "default"
        },
        deb = { icon = "", name = "Deb" },
        lock = { icon = "󰌾", name = "Lock" },
        mp3 = { icon = "󰎆", name = "Mp3" },
        mp4 = { icon = "", name = "Mp4" },
        out = { icon = "", name = "Out" },
        ["robots.txt"] = { icon = "󰚩", name = "Robots" },
        ttf = { icon = "", name = "TrueTypeFont" },
        rpm = { icon = "", name = "Rpm" },
        woff = { icon = "", name = "WebOpenFontFormat" },
        woff2 = { icon = "", name = "WebOpenFontFormat2" },
        xz = { icon = "", name = "Xz" },
        zip = { icon = "", name = "Zip" },
      },
    },
    config = function(_, opts)
      require("nvim-web-devicons").setup(opts)
      pcall(vim.api.nvim_del_user_command, "NvimWebDeviconsHiTest")
    end
  },

  --  LSP icons [icons]
  --  https://github.com/onsails/lspkind.nvim
  {
    "onsails/lspkind.nvim",
    opts = {
      mode = "symbol",
      symbol_map = {
        Array = "󰅪",
        Boolean = "⊨",
        Class = "󰌗",
        Constructor = "",
        Key = "󰌆",
        Namespace = "󰅪",
        Null = "NULL",
        Number = "#",
        Object = "󰀚",
        Package = "󰏗",
        Property = "",
        Reference = "",
        Snippet = "",
        String = "󰀬",
        TypeParameter = "󰊄",
        Unit = "",
        Codeium = "",
      },
      menu = {},
    },
    enabled = vim.g.icons_enabled,
    config = function(_, opts)
      require("lspkind").init(opts)
    end,
  },



  --  highlight-undo
  --  https://github.com/tzachar/highlight-undo.nvim
  --  This plugin only flases on redo.
  --  But we also have a autocmd to flash on yank.
  {
    "tzachar/highlight-undo.nvim",
    event = "User BaseDefered",
    opts = {
      hlgroup = "CurSearch",
      duration = 150,
      keymaps = {
        { "n", "u",     "undo", {} }, -- If you remap undo/redo, change this
        { "n", "<C-r>", "redo", {} },
      },
    },
    config = function(_, opts)
      require("highlight-undo").setup(opts)

      -- Also flash on yank.
      vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight yanked text",
        pattern = "*",
        callback = function() vim.highlight.on_yank() end,
      })
    end,
  },

  --  which-key.nvim [on-screen keybindings]
  --  https://github.com/folke/which-key.nvim
  {
    "folke/which-key.nvim",
    event = "User BaseDefered",
    opts = {
      icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
      disable = { filetypes = { "TelescopePrompt" } },
    },
    config = function(_, opts)
      require("which-key").setup(opts)
      require("base.utils").which_key_register()
    end,
  },


} -- end of return
