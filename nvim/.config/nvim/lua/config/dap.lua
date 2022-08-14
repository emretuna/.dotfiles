local dap = require("dap")

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "error", linehl = "", numhl = "" })
-- ADAPTERS
dap.adapters.node2 = {
  type = "executable",
  command = "node-debug2-adapter",
  -- args = {os.getenv('HOME') .. '/.zinit/plugins/microsoft---vscode-node-debug2.git/out/src/nodeDebug.js'},
  -- args =  { vim.fn.stdpath('data') .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
  args = {},
}
dap.configurations.javascript = {
  {
    name = "Launch",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = "Attach to process",
    type = "node2",
    request = "attach",
    restart = true,
    -- port = 9229
    processId = require("dap.utils").pick_process,
  },
}
dap.adapters.php = {
  type = "executable",
  command = "nodejs",
  args = { "/opt/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for xdebug",
    port = "9003",
    log = true,
    serverSourceRoot = "/srv/www/",
    localSourceRoot = "/home/www/VVV/www/",
  },
}
dap.adapters.ruby = {
  type = "executable",
  command = "bundle",
  args = { "exec", "readapt", "stdio" },
}

dap.configurations.ruby = {
  {
    type = "ruby",
    request = "launch",
    name = "Rails",
    program = "bundle",
    programArgs = { "exec", "rails", "s" },
    useBundler = true,
  },
}
require("nvim-dap-virtual-text").setup()
require("dapui").setup()
