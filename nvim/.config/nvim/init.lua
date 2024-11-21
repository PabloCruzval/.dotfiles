fn = vim.fn

--- Boostrap lazy.nvim & Load Plugins ---

local lazypath = fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
			{ out,                            'WarningMsg' },
			{ '\nPress any key to exit...' },
		}, true, {})
		fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

local lazy_conf = require 'configs-lazy.lazysetup'
require('lazy').setup(lazy_conf.plugins, lazy_conf.conf)


require 'nvim-options'
require 'map'

vim.defer_fn(function()
	print("Linters configurados:")
	print(vim.inspect(require("lint").linters_by_ft))
end, 1000)
