local wezterm = require("wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

local M = {}

function M.setup(config)
	-- Add keys for smart_workspace_switcher
	workspace_switcher.apply_to_config(config)
	workspace_switcher.zoxide_path = "/opt/homebrew/bin/zoxide"
	-- Resurrect configuration
	-- loads the state whenever I create a new workspace
	wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, path, label)
		local workspace_state = resurrect.workspace_state

		workspace_state.restore_workspace(resurrect.load_state(label, "workspace"), {
			window = window,
			relative = true,
			restore_text = true,
			on_pane_restore = resurrect.tab_state.default_on_pane_restore,
		})
	end)

	-- Saves the state whenever I select a workspace
	wezterm.on("smart_workspace_switcher.workspace_switcher.selected", function(window, path, label)
		local workspace_state = resurrect.workspace_state
		resurrect.save_state(workspace_state.get_workspace_state())
	end)
	local workspace_switcher_keys = {
		-- Resurrect keymaps
		{
			key = "r",
			mods = "LEADER",
			action = wezterm.action_callback(function(win, pane)
				resurrect.save_state(resurrect.workspace_state.get_workspace_state())
			end),
		},
		{
			key = "R",
			mods = "LEADER",
			action = resurrect.window_state.save_window_action(),
		},
		{
			key = "s",
			mods = "LEADER",
			action = wezterm.action_callback(function(win, pane)
				resurrect.save_state(resurrect.workspace_state.get_workspace_state())
				resurrect.window_state.save_window_action()
			end),
		},
		{
			key = ";",
			mods = "LEADER",
			action = wezterm.action_callback(function(win, pane)
				resurrect.fuzzy_load(win, pane, function(id, label)
					local type = string.match(id, "^([^/]+)") -- match before '/'
					id = string.match(id, "([^/]+)$") -- match after '/'
					id = string.match(id, "(.+)%..+$") -- remove file extension
					local state
					if type == "workspace" then
						state = resurrect.load_state(id, "workspace")
						resurrect.workspace_state.restore_workspace(state, {
							relative = true,
							restore_text = true,
							on_pane_restore = resurrect.tab_state.default_on_pane_restore,
						})
					elseif type == "window" then
						state = resurrect.load_state(id, "window")
						resurrect.window_state.restore_window(pane:window(), state, {
							relative = true,
							restore_text = true,
							on_pane_restore = resurrect.tab_state.default_on_pane_restore,
							-- uncomment this line to use active tab when restoring
							tab = win:active_tab(),
						})
					end
				end)
			end),
		},
		{
			key = "c",
			mods = "LEADER",
			action = wezterm.action_callback(function(win, pane)
				resurrect.fuzzy_load(win, pane, function(id)
					resurrect.delete_state(id)
				end, {
					title = "Delete State",
					description = "Select State to Delete and press Enter = accept, Esc = cancel, / = filter",
					fuzzy_description = "Search State to Delete: ",
					is_fuzzy = true,
				})
			end),
		},
		-- Workspace Switcher
		{
			key = "w",
			mods = "LEADER",
			action = workspace_switcher.switch_workspace({ extra_args = " | rg -Fxf ~/Code" }),
		},
	}
	-- Append new keys to config.keys
	for _, key_mapping in ipairs(workspace_switcher_keys) do
		table.insert(config.keys, key_mapping)
	end
end

return M
