local wezterm = require("wezterm")
local M = {}
-- you can put the rest of your Wezterm config here

wezterm.on("update-plugins", function(window, pane)
	wezterm.plugin.update_all()
	window:toast_notification("wezterm", "Plugins updated!", nil, 4000)
end)

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 1
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

function M.setup(config)
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
	config.disable_default_key_bindings = true
	config.hyperlink_rules = wezterm.default_hyperlink_rules()
	config.mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	}
	config.keys = {
		-- Attach to muxer
		{
			key = "a",
			mods = "LEADER",
			action = wezterm.action.AttachDomain("unix"),
		},
		-- Detach from muxer
		{
			key = "d",
			mods = "LEADER",
			action = wezterm.action.DetachDomain({ DomainName = "unix" }),
		},
		-- toggle opacity
		{
			key = "b",
			mods = "LEADER",
			action = wezterm.action.EmitEvent("toggle-opacity"),
		},
		{
			key = "p",
			mods = "LEADER",
			action = wezterm.action.ActivateCommandPalette,
		},
		{
			key = "n",
			mods = "LEADER",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		},
		{
			key = "t",
			mods = "LEADER",
			action = wezterm.action.ShowTabNavigator,
		},
		{
			key = "`",
			mods = "LEADER",
			action = wezterm.action.ShowLauncherArgs({
				flags = "LAUNCH_MENU_ITEMS|FUZZY|TABS|DOMAINS|WORKSPACES",
			}),
		},
		{
			key = ",",
			mods = "LEADER",
			action = wezterm.action.PromptInputLine({
				description = "Enter new name for workspace",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						wezterm.mux.rename_workspace(window:mux_window():get_workspace(), line)
					end
				end),
			}),
		},
		{
			key = [[\]],
			mods = "LEADER",
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = [[|]],
			mods = "LEADER",
			action = wezterm.action.SplitPane({
				top_level = true,
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			key = [[-]],
			mods = "LEADER",
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = [[_]],
			mods = "LEADER",
			action = wezterm.action.SplitPane({
				top_level = true,
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{
			key = "q",
			mods = "LEADER",
			action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
		},
		{ key = "f", mods = "SUPER", action = wezterm.action.Search({ CaseSensitiveString = "" }) },
		{ key = "u", mods = "LEADER", action = wezterm.action.EmitEvent("update-plugins") },
		{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
		{ key = "F11", mods = "", action = wezterm.action.ToggleFullScreen },
		{ key = "[", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "]", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "[", mods = "ALT", action = wezterm.action.MoveTabRelative(-1) },
		{ key = "]", mods = "ALT", action = wezterm.action.MoveTabRelative(1) },
		{ key = "y", mods = "CMD", action = wezterm.action.ActivateCopyMode },
		{ key = "c", mods = "CMD", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "v", mods = "CMD", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "z", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
		{ key = "=", mods = "ALT", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "ALT", action = wezterm.action.DecreaseFontSize },
		{ key = "0", mods = "SHIFT|ALT", action = wezterm.action.ResetFontSize },
		{ key = "1", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 8 }) },
	}
end

-- return keys and mouse
return M
