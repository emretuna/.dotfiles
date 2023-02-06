-- From https://github.com/folke/lazy.nvim
-- DO NOT change the paths and don't remove the colorscheme
local root = vim.fn.fnamemodify("./.repro", ":p")

-- set stdpaths to use .repro
for _, name in ipairs({ "config", "data", "state", "cache" }) do
  vim.env[("XDG_%s_HOME"):format(name:upper())] = root .. "/" .. name
end

-- bootstrap lazy
local lazypath = root .. "/plugins/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)
--if settings.theme == "nightfox" then
--    use({ "EdenEast/nightfox.nvim", config = get_config("ui.themes.nightfox") })
--  elseif settings.theme == "catppuccin" then
--    use({ "catppuccin/nvim", as = "catppuccin", config = get_config("ui.themes.catppuccin") })
--  elseif settings.theme == "kanagawa" then
--    use({ "rebelot/kanagawa.nvim", as = "kanagawa", config = get_config("ui.themes.kanagawa") })
--  elseif settings.theme == "onedarkpro" then
--    use({ "olimorris/onedarkpro.nvim", as = "onedarkpro", config = get_config("ui.themes.onedarkpro") })
--  elseif settings.theme == "tundra" then
--    use({ "sam4llis/nvim-tundra", config = get_config("ui.themes.tundra") })
--  elseif settings.theme == "tokyonight" then
--    use({ "folke/tokyonight.nvim", branch = "main", config = get_config("ui.themes.tokyonight") })
--  elseif settings.theme == "pywal" then
--    use({ "AlphaTechnolog/pywal.nvim", as = "pywal", config = get_config("ui.themes.pywal") })
--  else
--    use({ "catppuccin/nvim", as = "catppuccin", config = get_config("ui.themes.catppuccin") })
--  end
-- install plugins
local plugins = {
  "folke/tokyonight.nvim",
  -- add any other plugins here
}
require("lazy").setup(plugins, {
  root = root .. "/plugins",
})

vim.cmd.colorscheme("tokyonight")
-- add anything else here
