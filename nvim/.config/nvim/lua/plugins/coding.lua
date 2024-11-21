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
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFIle" },
		config = function()
			options.conform()
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
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFIle",
		},
		config = function()
			options.nvim_lint()
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
