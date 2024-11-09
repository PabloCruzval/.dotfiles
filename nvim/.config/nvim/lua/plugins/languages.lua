local options = require 'configs-lazy.configs'

return {
	{
		"lervag/vimtex",
		ft = {'tex'},
		init = function()
			options.vimtex()
		end
	},
}
