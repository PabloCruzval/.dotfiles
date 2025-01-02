local config = require("plugins.configs")

return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "BufAdd",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			config.lualine()
		end,
	},
	{
		"folke/which-key.nvim",
		keys = " ",
		init = function()
			require("which-key").setup()
		end,
	},
}
