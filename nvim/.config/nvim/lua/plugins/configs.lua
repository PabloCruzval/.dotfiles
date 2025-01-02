--- Mason & Lsp
local mason = function()
	require("mason").setup()
end

local mason_lspconfig = function()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls" },
	})
	--- Automatic lsp config
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,

		["arduino_language_server"] = function()
			require("lspconfig").arduino_language_server.setup({
				cmd = {
					"arduino-language-server",
					"-cli-config",
					"/home/nyx/.arduino15/arduino-cli.yaml",
					"-cli",
					"arduino-cli",
					"-clangd",
					"clangd",
					"-fqbn",
					"arduino:avr:uno",
				},
				filetypes = { "arduino", "ino" },
				root_dir = require("lspconfig.util").root_pattern(".git", "*.ino") or vim.fn.getcwd(),
			})
		end,
	})
end

local nvim_cmp = function()
	local cmp = require("cmp")
	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
		}),
	})
end

--- Debugger

local nvim_dap = function()
	require("mason-nvim-dap").setup({
		ensure_installed = { "python" },
		automatic_installation = true,
		handlers = {},
	})
	require("dapui").setup()
end
--- Linter & Formatter

local none_ls = function()
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettier,
		},
	})
end

--- Treesitter
local treesitter = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"json",
			"python",
			"javascript",
			"typescript",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
		},

		highlight = {
			enable = true,
			use_languagetree = true,
			disbled = { "latex" },
		},

		indent = { enable = true },

		auto_install = true,
	})
end

--- Telescope
local telescope_ui_select = function()
	require("telescope").setup({
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
	})
	require("telescope").load_extension("ui-select")
end

local lualine = function()
	require("lualine").setup()
end

local obsidian = function()
	return {
		workspaces = {
			{
				name = "Home",
				path = "/home/nyx/Obsidian/Home/",
			},
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
			["<leader>oo"] = {
				action = function()
					vim.cmd("ObsidianOpen")
				end,
				opts = { buffer = true, desc = "Obsidian: Open Obsidian" },
			},
			-- "Obsidian follow"
			["<leader>of"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true, desc = "Obsidian Follow" },
			},
			-- Toggle check-boxes "obsidian done"
			["<leader>od"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true, desc = "Toggle checkbox" },
			},
			-- Create a new newsletter issue
			["<leader>onn"] = {
				action = function()
					vim.cmd("ObsidianNew")
				end,
				opts = { buffer = true, desc = "Create a new newsletter" },
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
			subdir = "Templates",  -- Subdirectory for templates
			date_format = "%Y-%m-%d-%a", -- Date format for templates
			gtime_format = "%H:%M", -- Time format for templates
			tags = "",             -- Default tags for templates
		},
	}
end

return {
	mason = mason,
	mason_lspconfig = mason_lspconfig,
	nvim_cmp = nvim_cmp,
	nvim_dap = nvim_dap,
	none_ls = none_ls,
	treesitter = treesitter,
	telescope_ui_select = telescope_ui_select,
	lualine = lualine,
	obsidian = obsidian,
}
