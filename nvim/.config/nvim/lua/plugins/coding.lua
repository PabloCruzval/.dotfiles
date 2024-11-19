local options = require 'configs-lazy.configs'

return {
	--- LSP ---
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = function()
			options.mason()
		end
	},

	{
		'williamboman/mason-lspconfig.nvim',
		lazy = false,
		config = function()
			options.mason_lspconfig()
		end,
	},

	{
		"mfussenegger/nvim-lint",
		lazy = false,
		dependencies =
			{
				{
					"rshkarin/mason-nvim-lint",
					config = function ()
						require("mason-nvim-lint")
					end
				},
			},
		config = function ()
			require('lint').linters_by_ft = {
			  markdown = {'vale'},
			}
		end
	},

	{
		'neovim/nvim-lspconfig',
		lazy = false,
		config = function()
			options.lspconfig()
		end
	},

	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'rcarriga/nvim-dap-ui',
			'nvim-neotest/nvim-nio',
			'jay-babu/mason-nvim-dap.nvim',
		},
		config = function()
			options.dap()
		end
	},
}
