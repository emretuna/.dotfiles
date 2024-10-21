local wezterm = require("wezterm")

local M = {}

function M.setup(config)
	local function is_vim(pane)
		local process_info = pane:get_foreground_process_info()
		local process_name = process_info and process_info.name

		return process_name == "nvim" or process_name == "vim"
	end

	local direction_keys = {
		Left = "h",
		Down = "j",
		Up = "k",
		Right = "l",
		-- reverse lookup
		h = "Left",
		j = "Down",
		k = "Up",
		l = "Right",
	}

	local function split_nav(resize_or_move, key)
		return {
			key = key,
			mods = resize_or_move == "resize" and "META" or "CTRL",
			action = wezterm.action_callback(function(win, pane)
				if is_vim(pane) then
					-- pass the keys through to vim/nvim
					win:perform_action({
						SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
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

	local nav_keys = {
		-- move between split panes
		split_nav("move", "h"),
		split_nav("move", "j"),
		split_nav("move", "k"),
		split_nav("move", "l"),
		-- resize panes
		split_nav("resize", "h"),
		split_nav("resize", "j"),
		split_nav("resize", "k"),
		split_nav("resize", "l"),
	}
	-- Append new keys to config.keys
	for _, key_mapping in ipairs(nav_keys) do
		table.insert(config.keys, key_mapping)
	end
end
return M
