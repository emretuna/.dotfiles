return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
	init = function()
		-- Flash
		vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require("flash").jump() end, { desc = "Flash" })
		-- Flash Treesitter
		vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
		-- Remote Flash
		vim.keymap.set('o', 'r', function() require("flash").remote() end, { desc = "Remote Flash" })
		-- Treesitter Search
		vim.keymap.set({ 'o', 'x' }, 'R', function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
		-- Toggle Flash Search
		vim.keymap.set('c', '<c-s>', function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
	end,
}
