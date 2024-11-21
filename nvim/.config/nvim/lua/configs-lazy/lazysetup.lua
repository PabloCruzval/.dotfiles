local M = {}

M.conf = {
	defaults = { lazy = true },
	ui = {
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},
}

M.plugins = {
	require 'plugins.coding',
	require 'plugins.languages',
	require 'plugins.tools',
	require 'plugins.ui',
}

return M
