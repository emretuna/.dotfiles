local wezterm = require("wezterm")

local Keys = {}

local function is_vi_process(pane)
	return pane:get_foreground_process_name():find("n?vim") ~= nil
end

-- Navigation and resizing keybindings:
--
-- h, j, k, l: These keys are mapped to navigation or resizing actions based on the context. In the case of a Vi mode process, they send the respective key to the terminal. Otherwise, they perform navigation or resizing actions on the panes.
-- Alt+h, Alt+j, Alt+k, Alt+l: Similar to the above keybindings, but specifically for resizing actions.
-- Splitting panes:
--
-- Alt+\: Splits the current pane horizontally.
-- Alt+Shift+|: Splits the current pane vertically.
-- Pane and tab management:
--
-- Alt+-: Splits the current pane vertically.
-- Alt+Shift+_: Splits the current pane horizontally.
-- n: Spawns a new tab using the same domain as the current pane.
-- Q: Closes the current tab without asking for confirmation.
-- q: Closes the current pane without asking for confirmation.
-- z: Toggles the zoom state of the current pane.
-- F11: Toggles fullscreen mode.
-- Alt+[: Activates the previous tab.
-- Alt+]: Activates the next tab.
-- Alt+Shift+[: Moves the current tab to the left.
-- Alt+Shift+]: Moves the current tab to the right.
-- Copy and paste:
--
-- y: Activates copy mode for scrolling and copying text.
-- Ctrl+Shift+c: Copies selected text to the clipboard.
-- Ctrl+Shift+v: Pastes text from the clipboard.
-- Font size:
--
-- Ctrl+=: Increases the font size.
-- Ctrl+-: Decreases the font size.
-- Tab activation:
--
-- Alt+1 to Alt+9: Activates the corresponding tab based on its index.
--
local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "SHIFT|ALT" or "ALT",
		action = wezterm.action_callback(function(win, pane)
			if is_vi_process(pane) then
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "SHIFT|ALT" or "ALT" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

function Keys.setup(config)
	config.disable_default_key_bindings = false
	config.keys = {
		split_nav("move", "h"),
		split_nav("move", "j"),
		split_nav("move", "k"),
		split_nav("move", "l"),
		split_nav("resize", "h"),
		split_nav("resize", "j"),
		split_nav("resize", "k"),
		split_nav("resize", "l"),
		{
			mods = "ALT",
			key = "t",
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			mods = "ALT|SHIFT",
			key = "t",
			action = wezterm.action.SplitPane({
				top_level = false,
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			mods = "ALT",
			key = "v",
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			mods = "ALT|SHIFT",
			key = "v",
			action = wezterm.action.SplitPane({
				top_level = false,
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{
			key = "n",
			mods = "ALT|SHIFT",
			action = wezterm.action.ShowLauncherArgs({
				flags = "LAUNCH_MENU_ITEMS|FUZZY|TABS|DOMAINS|WORKSPACES",
			}),
		},
		{ key = "x", mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
		{ key = "z", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
		{ key = "F11", mods = "", action = wezterm.action.ToggleFullScreen },
		{ key = "h", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "l", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "h", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(-1) },
		{ key = "l", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(1) },
		{ key = "y", mods = "ALT", action = wezterm.action.ActivateCopyMode },
		{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.IncreaseFontSize },
		{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.DecreaseFontSize },
		-- { key = "0", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 0 }) },
		-- { key = "1", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 1 }) },
		-- { key = "2", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 2 }) },
		-- { key = "3", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 3 }) },
		-- { key = "4", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 4 }) },
		-- { key = "5", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 5 }) },
		-- { key = "6", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 6 }) },
		-- { key = "7", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 7 }) },
		-- { key = "8", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 8 }) },
		-- { key = "9", mods = "SHIFT|ALT", action = wezterm.action({ ActivateTab = 9 }) },
	}
end

return Keys
