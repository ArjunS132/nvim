
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug( 'nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'} )
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug( 'nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug 'vimwiki/vimwiki'
Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-telescope/telescope.nvim'
Plug 'RishabhRD/nvim-lsputils'
Plug 'RishabhRD/popfix'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'mfussenegger/nvim-jdtls'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

vim.call('plug#end')

require('config/cmp')
require('config/telescope')
require('config/treesitter')
require('config/lsp')
require('config/colorscheme')
require('config/lsputil')
