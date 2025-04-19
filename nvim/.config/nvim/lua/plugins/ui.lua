local config = require("plugins.configs")

return {
	{
		"goolord/alpha-nvim",
		lazy = false,
		dependencies = { "kyazdani42/nvim-web-devicons"},
		config = function ()
			config.alpha()
		end
	},
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
