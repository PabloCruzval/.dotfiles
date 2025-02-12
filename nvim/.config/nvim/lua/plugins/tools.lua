local config = require("plugins.configs")

return {
	--- LSP & Mason
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			config.mason()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			config.mason_lspconfig()
		end,
	},

	{
		"neovim/nvim-lspconfig",
	},

	--- Autocomplete
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-path",
		},
		config = function()
			config.nvim_cmp()
		end,
	},

	--- Debugger

	{
		"mfussenegger/nvim-dap",
		cmd = {
			'Lua require("dapui").open()',
			'Lua require("dapui").close()',
			'Lua require("dap").toggle_breakpoint()',
			'Lua require("dap").continue()',
		},
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			config.nvim_dap()
		end,
	},

	--- Linters
	{
		"nvimtools/none-ls.nvim",
		event = "BufAdd",
		config = function()
			config.none_ls()
		end,
	},

	--- Auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	--- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		config = function()
			config.treesitter()
		end,
	},

	--- Find files & more
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = false,
		config = function()
			config.telescope_ui_select()
		end,
	},
	{
		"numToStr/Comment.nvim",
		cmd = {
			'Lua require("Comment.api").toggle.linewise(vim.fn.visualmode())',
			'Lua require("Comment.api").toggle.linewise.current()',
		},
		config = function()
			require("Comment").setup()
		end,
	},

	--- Obsidian
	{
		"epwalsh/obsidian.nvim",
		lazy = false,
		cond = function()
			local carpeta = vim.fn.getcwd() .. "/.obsidian"
			return vim.fn.isdirectory(carpeta) == 1
		end,
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = config.obsidian(),
	},
}
