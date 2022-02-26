local o = vim.opt
local wo = vim.wo
local fn = vim.fn

o.backspace = 'indent,eol,start'
o.errorbells = false
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.relativenumber = true
o.number = true
o.hidden = true
o.wrap = false
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.swapfile = false
o.backup = false
o.undofile = true
o.undodir = fn.stdpath('config') .. '/undodir2'
o.scrolloff = 8
o.updatetime = 50
o.termguicolors = true
o.hlsearch = false
o.completeopt = 'menu,menuone,noselect'

-- 80 character limit column
o.colorcolumn = '80'
o.signcolumn = 'yes'
o.syntax = 'on'
o.guicursor = ''
o.termguicolors = true
o.background = "dark" -- or "light" for light mode
