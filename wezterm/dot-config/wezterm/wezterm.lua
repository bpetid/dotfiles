-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux

config.enable_wayland = true
config.webgpu_power_preference = "LowPower"
config.front_end = "WebGpu"
config.log_unknown_escape_sequences = true


config.default_prog = { '/usr/bin/fish', '-l' }


config.color_scheme = 'Rosé Pine (base16)'


config.font = wezterm.font_with_fallback {
	{
		family = 'Monaspace Argon',
		weight = 'Light',
		harfbuzz_features = {
			'calt=1', 'liga=1', 'ss01=1', 'ss02=1', 'ss03=1', 'ss04=1', 'ss05=1', 'ss06=1', 'ss07=1', 'ss08=1', 'ss09=1'
		},
	},
	{
		family = 'Symbols Nerd Font Mono',
	},
	{
		family = 'Noto Fonts Emoji',
	}
}
config.font_size = 14.0
config.freetype_load_target = 'Light'
config.freetype_interpreter_version = 40
config.freetype_load_flags = 'NO_AUTOHINT'
config.allow_square_glyphs_to_overflow_width = 'Always'


config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.colors = {
	tab_bar = {
		background = '#050802',
		active_tab = {
			bg_color = '#050802',
			fg_color = '#c0c0c0',
			intensity = 'Half',
		}
	}
}
config.initial_cols = 160
config.initial_rows = 48

return config
