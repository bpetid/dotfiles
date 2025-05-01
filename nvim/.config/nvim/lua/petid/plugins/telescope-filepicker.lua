if jit.os == "Linux" then
	return {
		'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
	}
elseif jit.os == "Windows" then
	return {
		"Verf/telescope-everything.nvim",
	}
end
