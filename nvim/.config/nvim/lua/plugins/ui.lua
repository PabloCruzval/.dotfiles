local options = require 'configs-lazy.configs'

return {
	------ Themes ------
	--- One DarkPro
	{
		'olimorris/onedarkpro.nvim',
		-- lazy = false,
	},
	--- Tokyo Night
	{
		'folke/tokyonight.nvim',
		-- lazy = false,
		priority = 1000,
		opts = {},
	},
	--- Catppuccin
	{
		'catppuccin/nvim',
		lazy = false,
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		event = "BufAdd",
		main = "ibl",
		config = function ()
			options.ibl()
		end
	},
	------ Alpha ------
	{
      'goolord/alpha-nvim',
       lazy = false,
		 dependencies = { 'kyazdani42/nvim-web-devicons' },
       config = function()
           options.alpha()
       end
	},
	------ LuaLine  ------
	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
		config = function()
			options.lualine()
		end
	},
	------ File Tree ------
	--- Neo Tree
	{
		'nvim-neo-tree/neo-tree.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
		},
		config = function()
			options.neotree()
		end
	},
	--- Nvim Tree
	-- {
	-- 	'nvim-tree/nvim-tree.lua',
	-- 	cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
	-- 	dependencies = { 'nvim-tree/nvim-web-devicons' },
	-- 	config = function()
	-- 		require('nvim-tree').setup(options.nvim_tree())
	-- 	end,
	-- },
	------ Transparent ------
	{
		'xiyaowong/transparent.nvim',
		-- lazy = false,
		init = function()
			options.transparent()
		end
	},
}
