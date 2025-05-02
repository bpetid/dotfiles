-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window {}
	window:gui_window():maximize()
end)

-- This is where you actually apply your config choices
config.enable_wayland = false

config.default_prog = { '/usr/bin/fish', '-l' }

config.color_scheme = 'Tokyo Night Moon'

config.harfbuzz_features = { 'calt', 'liga', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08',
	'ss09' }

config.font = wezterm.font_with_fallback {
	'MonaspiceAr Nerd Font Mono',
	'Symbols Nerd Font Mono',
	'Noto Fonts Emoji'
}

config.font_size = 12.0
-- config.freetype_load_target = 'Light'

config.use_fancy_tab_bar = false

config.colors = {
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = '#0b0022',

		-- The active tab is the one that has focus in the window
		active_tab = {
			-- The color of the background area for the tab
			bg_color = '#2b2042',
			-- The color of the text for the tab
			fg_color = '#c0c0c0',

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = 'Normal',
		}
	}
}

config.initial_cols = 160
config.initial_rows = 48

return config
