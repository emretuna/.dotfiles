local null_ls = require("null-ls")
local utils = require("null-ls.utils")

null_ls.setup({
  -- debug = true,
  -- root_dir = utils.root_pattern("composer.json", "package.json", "Makefile", ".git"), -- Add composer
  diagnostics_format = "#{m} (#{c}) [#{s}]", -- Makes PHPCS errors more readeable
  sources = {
    null_ls.builtins.code_actions.eslint_d, -- Install it with `npm i -g eslint_d`
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.completion.spell, -- You still need to execute `:set spell`
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.markdownlint.with({
      extra_args = { "--disable", "line-length" },
    }), -- Install it with `npm i -g markdownlint-cli`
    null_ls.builtins.diagnostics.phpcs.with({ -- Use the local installation first
      only_local = "vendor/bin",
    }),
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.phpcbf.with({
      prefer_local = "vendor/bin",
    }),
  },
})
