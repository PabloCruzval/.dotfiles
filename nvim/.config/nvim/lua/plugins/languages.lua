local options = require 'configs-lazy.configs'

return {
	{
		"lervag/vimtex",
		ft = {'tex'},
		init = function()
			options.vimtex()
		end
	},
	{
		"lukas-reineke/headlines.nvim",
		ft = "markdown",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = {},
	}
}
