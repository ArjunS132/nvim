
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- treesitter for better syntax highlighting
Plug( 'nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'} )

-- supporting plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
-- game to practice vim
Plug 'ThePrimeagen/vim-be-good'
-- fuzzy finder
Plug( 'nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug 'nvim-telescope/telescope.nvim'
-- note taking
Plug 'vimwiki/vimwiki'
-- colorscheme
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug('catppuccin/nvim', {['as']= 'catppuccin' } )
Plug 'folke/tokyonight.nvim'
-- undotree
Plug 'mbbill/undotree'
-- lsp stuff
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'RishabhRD/nvim-lsputils'
Plug 'RishabhRD/popfix'
Plug 'mfussenegger/nvim-jdtls'
-- nice plugins by tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
-- html tags
Plug 'mattn/emmet-vim'
-- autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
-- snipets
Plug( 'L3MON4D3/LuaSnip', {['tag'] = 'v2.*', ['do'] = 'make install_jsregexp'})
Plug 'saadparwaiz1/cmp_luasnip'
-- Plug "rafamadriz/friendly-snippets"
Plug "evesdropper/luasnip-latex-snippets.nvim"

-- dap
Plug "mfussenegger/nvim-dap"
Plug "jay-babu/mason-nvim-dap.nvim"

-- LaTeX
Plug "lervag/vimtex"

vim.call('plug#end')

require('config/cmp')
require('config/telescope')
require('config/treesitter')
require('config/colorscheme')
require('config/lsputil')
require('config/mason')
require('config/jdtls')
require('config/vimtex')
require('config/luasnips')
