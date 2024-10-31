local wezterm = require("wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

local M = {}

function M.setup(config)
	-- Add keys for smart_workspace_switcher
	workspace_switcher.zoxide_path = "/opt/homebrew/bin/zoxide"
	workspace_switcher.apply_to_config(config)

	-- Resurrect configuration
	resurrect.periodic_save()
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

	-- Add augment-command-palette
	wezterm.on("augment-command-palette", function(window, pane)
		local workspace_state = resurrect.workspace_state
		return {
			{
				brief = "Window | Workspace: Switch Workspace",
				icon = "md_briefcase_arrow_up_down",
				action = workspace_switcher.switch_workspace(),
			},
			{
				brief = "Window | Workspace: Rename Workspace",
				icon = "md_briefcase_edit",
				action = wezterm.action.PromptInputLine({
					description = "Enter new name for workspace",
					action = wezterm.action_callback(function(window, pane, line)
						if line then
							wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
							resurrect.save_state(workspace_state.get_workspace_state())
						end
					end),
				}),
			},
		}
	end)
	local workspace_switcher_keys = {
		-- Resurrect keymaps
		-- https://github.com/MLFlexer/resurrect.wezterm
		{
			key = "s",
			mods = "LEADER",
			action = wezterm.action_callback(function(win, pane)
				resurrect.save_state(resurrect.workspace_state.get_workspace_state())
				resurrect.window_state.save_window_action()
			end),
		},
		-- Workspace switcher keys
		{
			key = "r",
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
			key = "d",
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
		-- Smart Workspace Switcher
		{
			key = "w",
			mods = "LEADER",
			-- filter dirs from ~/.project file
			-- action = workspace_switcher.switch_workspace({ extra_args = " | -Fzf ~/.projects" }),
			action = workspace_switcher.switch_workspace(),
		},
	}
	-- Append new keys to config.keys
	for _, key_mapping in ipairs(workspace_switcher_keys) do
		table.insert(config.keys, key_mapping)
	end
end

return M
