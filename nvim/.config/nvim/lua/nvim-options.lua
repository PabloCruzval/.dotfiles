local opt = vim.opt
local g = vim.g
local o = vim.o

--- Keys ---
g.mapleader = ' '
g.maplocalleader = ' '

--- Numbers & Tabs ---

--- Numbers
o.number = true
o.relativenumber = true
o.numberwidth = 2

--- Tabs ---
o.tabstop = 3
o.softtabstop = 3
o.shiftwidth = 3

o.spelllang = 'es_es'

--- Remove ~
opt.fillchars = { eob = " " }

vim.cmd [[colorscheme catppuccin-mocha]]
