return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  lazy = true,
  -- NOTE: And you can specify dependencies as well
  enabled = vim.g.dap_enabled,
  dependencies = {
    -- Creates a beautiful debugger UI
    { 'rcarriga/nvim-dap-ui', lazy = true, enabled = vim.g.dap_enabled },

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    {
      'rcarriga/cmp-dap',
      dependencies = { 'nvim-cmp' },
      enabled = vim.g.dap_enabled,
      config = function()
        require('cmp').setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
          sources = {
            { name = 'dap' },
          },
        })
      end,
    },
    {
      'mxsdev/nvim-dap-vscode-js',
      dependencies = {
        'microsoft/vscode-js-debug',
        version = '1.x',
        build = 'npm i && npm run compile vsDebugServerBundle && mv dist out',
      },
    },
    -- Add your own debuggers here
    -- 'leoluz/nvim-dap-go',
  },
  keys = function(_, keys)
    local dap = require 'dap'
    local dapui = require 'dapui'
    return {
      -- Basic debugging keymaps, feel free to change to your liking!
      { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
      { '<F1>', dap.step_into, desc = 'Debug: Step Into' },
      { '<F2>', dap.step_over, desc = 'Debug: Step Over' },
      { '<F3>', dap.step_out, desc = 'Debug: Step Out' },
      { 'gb', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
      {
        'gB',
        function()
          dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Set Breakpoint',
      },
      -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
      { '<F7>', dapui.toggle, desc = 'Debug: See last session result.' },
      unpack(keys),
    }
  end,
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,
      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'php',
        'js-debug-adapter',
      },
    }
    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open { reset = true }
    end
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    require('dap-vscode-js').setup {
      -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
      debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug', -- Path to vscode-js-debug installation.
      -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
      -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
      -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
      -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
    }

    -- PHP
    dap.adapters.php = {
      type = 'executable',
      command = vim.fn.stdpath 'data' .. '/mason/bin/php-debug-adapter',
    }
    dap.configurations.php = {
      {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9000,
      },
    }
    -- Javascript and Typescript
    for _, language in ipairs { 'typescript', 'javascript', 'typescriptreact' } do
      require('dap').configurations[language] = {
        -- https://github.com/mxsdev/nvim-dap-vscode-js
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-chrome',
          request = 'launch',
          name = 'Start Chrome with "localhost"',
          url = 'http://localhost:3000',
          webRoot = '${workspaceFolder}',
          userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
        },
      }
    end
  end,
}
