local options = require 'configs-lazy.configs'

return {
	------ CMP ------
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{
				'L3MON4D3/LuaSnip',
				dependencies = {
					'saadparwaiz1/cmp_luasnip',
					'rafamadriz/friendly-snippets'
				}
			},
			{
				'windwp/nvim-autopairs',
				opts = {
					fast_wrap = {},
					disable_filetype = { 'TelescopePrompt', 'vim' },
				},
				config = function(_, opts)
					require('nvim-autopairs').setup(opts)
					local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
					require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
				end,
			},
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
		},
		config = function()
			options.cmp()
		end
	},

	--- Git ---
	{
		'lewis6991/gitsigns.nvim',
		event = "BufAdd",
		config = function ()
			require("gitsigns").setup()
		end
	},

	--- Treesitter ---
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		config = function()
			options.treesitter()
		end
	},

	--- Find Files & More ---
	{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		lazy = false,
		config = function()
			options.telescope_ui_select()
		end
	},
	--- Wich Key ---
	{
		'folke/which-key.nvim',
		keys = ' ',
		init = function()
			require('which-key').setup()
		end
	},
	--- Comments ---
	{
		'numToStr/Comment.nvim',
		cmd = {
			'Lua require("Comment.api").toggle.linewise(vim.fn.visualmode())',
			'Lua require("Comment.api").toggle.linewise.current()',
		},
		config = function()
		require('Comment').setup()
		end
	},
	--- To do
	{
		'folke/todo-comments.nvim',
		dependencies = {'nvim-lua/plenary.nvim'},
		opts = {signs = false},
	},
	{
		'max397574/better-escape.nvim',
		event = 'InsertEnter',
		config = function()
			options.better_escape()
		end
	},
	{
		'ThePrimeagen/vim-be-good'
	},
}
