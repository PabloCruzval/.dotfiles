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

	--- Obsidian
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		opts = {
			workspaces = {
				{
					name = "Home",
					path = "/home/nyx/Obsidian/Home/",
				}
      	},
      	completation = {
      		nvim_cmp = true,
      		min_chars = 2,
      	},
      	notes_subdir = "Limbo",
      	new_notes_location = "Limbo",
      	attachments = {
      		img_folder = "Files",
      	},
      	daily_notes = {
      		template = "note",
      	},
      	mappings = {
      		-- "Obsidian follow"
      		["<leader>of"] = {
      			action = function()
      				return require("obsidian").util.gf_passthrough()
      			end,
      			opts = { noremap = false, expr = true, buffer = true, desc = "Obsidian Follow"},
      		},
      		-- Toggle check-boxes "obsidian done"
      		["<leader>od"] = {
      			action = function()
      				return require("obsidian").util.toggle_checkbox()
      			end,
      			opts = { buffer = true , desc = "Toggle checkbox"},
      		},
      		-- Create a new newsletter issue
      		["<leader>onn"] = {
      			action = function()
      				return require("obsidian").commands.new_note("Newsletter-Issue")
      			end,
      			opts = { buffer = true, desc = "Create a new newsletter"},
      		},
      		["<leader>ont"] = {
      			action = function()
      				return require("obsidian").util.insert_template("Newsletter-Issue")
      			end,
      			opts = { buffer = true },
      		},
      	},
      	-- Function to generate frontmatter for notes
      	note_frontmatter_func = function(note)
      		-- This is equivalent to the default frontmatter function.
      		local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      		-- `note.metadata` contains any manually added fields in the frontmatter.
      		-- So here we just make sure those fields are kept in the frontmatter.
      		if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      			for k, v in pairs(note.metadata) do
      				out[k] = v
      			end
      		end
      		return out
      	end,
      	-- Function to generate note IDs
      	note_id_func = function(title)
      		-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      		-- In this case a note with the title 'My new note' will be given an ID that looks
      		-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      		local suffix = ""
      		if title ~= nil then
      			-- If title is given, transform it into valid file name.
      			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      		else
      			-- If title is nil, just add 4 random uppercase letters to the suffix.
      			for _ = 1, 4 do
      				suffix = suffix .. string.char(math.random(65, 90))
      			end
      		end
      		return tostring(os.time()) .. "-" .. suffix
      	end,
      	-- Settings for templates
      	templates = {
      		subdir = "Templates", -- Subdirectory for templates
      		date_format = "%Y-%m-%d-%a", -- Date format for templates
      		gtime_format = "%H:%M", -- Time format for templates
      		tags = "", -- Default tags for templates
      	},
      },
	}
}
