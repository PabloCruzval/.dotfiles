------ LSP ------
--- Mason
local mason = function()
	return {
		require('mason').setup()
	}
end

--- Mason Lsp Config
local mason_lspconfig = function()
	return {
		require('mason-lspconfig').setup({
			ensure_installed = {'lua_ls'},
			automatic_installation = true,
			run_on_start = true,
		}),
	}
end

--- Lsp Config
local lspconfig = function()
	local map = function(keys, func, desc, mode)
		mode = mode or 'n'
		vim.keymap.set(mode, keys, func, { desc = desc })
	end
	map('<space>lh', vim.lsp.buf.hover, 'LSP: Hover')
	map('<space>ld', vim.lsp.buf.definition, 'LSP: Go to definition')
	map('ca', vim.lsp.buf.code_action, 'LSP')
	map('<space>rn', vim.lsp.buf.rename, 'LSP: Rename')

end

------ CMP ------
local cmp = function()
	local cmp = require 'cmp'
	require('luasnip.loaders.from_vscode').lazy_load()

	cmp.setup({
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'buffer' },
			{ name = 'path' },
		}),
	})
end

------ DAP ------
local dap_conf = function()
	local dap = require 'dap'
	local dapui = require 'dapui'
	local map = vim.keymap.set

	require('dapui').setup()
	require('mason-nvim-dap').setup({
		handlers = {},
	})
	dap.listeners.before.attach.dapui_config = function ()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function ()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end


	map('n', '<space>dt', dap.toggle_breakpoint, { desc = 'Dap BreakPoint' })
	map('n', '<space>dc', dap.continue, { desc = 'Dap Continue' })
end

------ Treesitter ------
local treesitter = function()
	require('nvim-treesitter.configs').setup({
		ensure_installed = {
			'json',
			'python',
			'javascript',
			'typescript',
			'yaml',
			'html',
			'css',
			'markdown',
			'markdown_inline',
			'bash',
			'lua',
			'vim'
		},

		highlight = {
			enable = true,
			use_languagetree = true,
			disable = { 'latex' },
			additional_vim_regex_highlight = { 'latex', 'markdown' },
		},

		indent = { enable = true },

		auto_install = true,
	})
end

------ Nvim Tree ------

local nvim_tree = function()
	 return {
		sort = {
			sorter = 'case_sensitive',
		},
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = false,
		},
	}
end

------ Neo Tree ------

local neotree = function()
	require('neo-tree').setup({
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
	 	}
		},
	})
end

------ Lualine ------
local lualine = function()
	require('lualine').setup({
		--options = {
			-- theme = 'dracula'
		---}
	})
end


------ Telescope Ui Selector ------
local telescope_ui_selector = function()
	require('telescope').setup({
		extensions = {
			['ui-select'] = {
				require('telescope.themes').get_dropdown{
				}
			}
		}
	})
	require('telescope').load_extension('ui-select')
end

------ Alpha ------

local alpha = function()
	local alpha_dashboards_headers = require 'dashboards'
	local alpha = require 'alpha'
	local dashboard = require 'alpha.themes.dashboard'

	local function alpha_format_text(text)
		 return {
			  type = 'text',
			  val = text,
			  opts = { hl = 'NvimDashColor', shrink_margin = false, position = 'center' },
		 }
	end

	local function format_text(text)
		 local formated_text = {}
		 for _, line in ipairs(text) do
			  table.insert(formated_text, alpha_format_text(line))
		 end
		 return formated_text
	end

	 dashboard.section.header.type = 'group'
	 dashboard.section.header.val = format_text(alpha_dashboards_headers)

	 dashboard.section.buttons.val = {
		  dashboard.button('e', '  New File', ':ene <BAR> startinsert <CR>'),
		  dashboard.button('f', '  Find File', '<cmd> Telescope find_files <CR>'),
		  dashboard.button('r', '  Recently Opened Files', ':Telescope oldfiles<CR>'),
		  dashboard.button('q', '󰩈  Exit', ':qa<CR>'),
	 }

	 alpha.setup(dashboard.opts)
end

------ Transparent ------
local transparent = function()
	require('transparent').setup({
		groups = {
			'normal', 'normalnc', 'comment', 'constant', 'special', 'identifier',
			'statement', 'preproc', 'type', 'underlined', 'todo', 'string', 'function',
			'conditional', 'repeat', 'operator', 'structure', 'linenr', 'nontext',
			'signcolumn', 'cursorline', 'cursorlinenr', 'statusline', 'statuslinenc',
			'endofbuffer',
		},
		extra_groups = {
			'normalfloat',
			'WichKeyFloat',
			'WichKeyNormal',
			'WichKey',
		},
		exclude_groups = {},
	})
	require('transparent').clear_prefix('telescope')
	require('transparent').clear_prefix('nvimtree')
	require('transparent').clear_prefix('lualine')
	require('transparent').clear_prefix('which-key')
end

local better_escape = function ()
	require('better_escape').setup({
	timeout = 100,
	default_mappings = true,
	mappings = {
		i = {
			j = {
				k = '<Esc>',
				},
			},
		},
	})
end

local ibl = function ()
	local scope = "focus"
	local indent = "passive"
	local hooks = require "ibl.hooks"

	hooks.register(hooks.type.HIGHLIGHT_SETUP, function ()
		vim.api.nvim_set_hl(0, "focus", { fg = "#f5c2e7"})
		vim.api.nvim_set_hl(0, "passive", { fg = "#313244"})
	end)

	require("ibl").setup({
		scope = {
			highlight = scope,
			show_start = false,
			show_end = false,
		},
		indent = { highlight = indent },
	})
end

local vimtex = function ()
	vim.g.vimtex_compiler_latexmk = { out_dir = 'build' }
	vim.cmd('syntax enable')
end

return {
	cmp = cmp,
	nvim_tree = nvim_tree,
	alpha = alpha,
	transparent = transparent,
	mason = mason,
	mason_lspconfig = mason_lspconfig,
	lspconfig = lspconfig,
	telescope_ui_select = telescope_ui_selector,
	treesitter = treesitter,
	lualine = lualine,
	neotree = neotree,
	dap = dap_conf,
	better_escape = better_escape,
	vimtex = vimtex,
	ibl = ibl,
}