local wezterm = require("wezterm")
local Tab = {}

local function get_process(tab)
	local process_icons = {
		["docker"] = {
			{ Text = "󰡨" },
		},
		["docker-compose"] = {
			{ Text = "󰡨" },
		},
		["lazydocker"] = {
			{ Text = "󰡨" },
		},
		["nvim"] = {
			{ Text = "" },
		},
		["vim"] = {
			{ Text = "" },
		},
		["node"] = {
			{ Text = "󰋘" },
		},
		["zsh"] = {
			{ Text = "" },
		},
		["bash"] = {
			{ Text = "" },
		},
		["htop"] = {
			{ Text = "" },
		},
		["btop"] = {
			{ Text = "" },
		},
		["bpytop"] = {
			{ Text = "" },
		},
		["cargo"] = {
			{ Text = "󰣣" },
		},
		["go"] = {
			{ Text = "" },
		},
		["git"] = {
			{ Text = "󰊢" },
		},
		["lazygit"] = {
			{ Text = "󰊢" },
		},
		["lua"] = {
			{ Text = "" },
		},
		["wget"] = {
			{ Text = "󰄠" },
		},
		["curl"] = {
			{ Text = "" },
		},
		["gh"] = {
			{ Text = "" },
		},
		["flatpak"] = {
			{ Text = "󰏖" },
		},
		["dotnet"] = {
			{ Text = "󰪮" },
		},
		["cointop"] = {
			{ Text = "" },
		},
		["composer"] = {
			{ Text = "" },
		},
	}

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
	if not process_name then
		process_name = "zsh"
	end

	return wezterm.format(process_icons[process_name] or { { Text = string.format("[%s]", process_name) } })
end

local function get_current_working_folder_name(tab)
	local cwd_uri = tab.active_pane.current_working_dir

	if cwd_uri then
		local cwd = ""
		if type(cwd_uri) == "userdata" then
			cwd = cwd_uri.file_path
		else
			cwd_uri = cwd_uri:sub(8)
			local slash = cwd_uri:find("/")
			if slash then
				cwd = cwd_uri:sub(slash):gsub("%%(%x%x)", function(hex)
					return string.char(tonumber(hex, 16))
				end)
			end
		end

		if cwd == os.getenv("HOME") then
			return "~"
		end

		return string.format("%s", string.match(cwd, "[^/]+$"))
	end
end

function Tab.setup(config)
	config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.show_new_tab_button_in_tab_bar = true
	config.tab_max_width = 50
	config.hide_tab_bar_if_only_one_tab = true

	wezterm.on("format-tab-title", function(tab)
		return wezterm.format({
			{ Attribute = { Intensity = "Half" } },
			{ Text = string.format(" %s  ", tab.tab_index + 1) },
			"ResetAttributes",
			{ Text = get_process(tab) },
			{ Text = " " },
			{ Text = get_current_working_folder_name(tab) },
			{ Text = "  ▕" },
		})
	end)
end

return Tab
