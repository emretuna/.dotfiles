local lint = require("lint")
local phpcs = require("lint.linters.phpcs")

lint.linters_by_ft = {
    php = { "phpcs" },
}

-- Fix PHPCS
if vim.loop.fs_stat("vendor/bin/phpcs") then
    phpcs.cmd = "vendor/bin/phpcs"
end
