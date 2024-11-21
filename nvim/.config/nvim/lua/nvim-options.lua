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
o.conceallevel = 1
--- Tabs ---
o.tabstop = 3
o.softtabstop = 3
o.shiftwidth = 3

o.spelllang = 'es_es'
o.spell = true
--- Remove ~
opt.fillchars = { eob = " " }

vim.cmd [[colorscheme catppuccin-mocha]]
