" sets
syntax on
set guicursor=
set backspace=indent,eol,start
set noerrorbells
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent
set relativenumber number
set hidden
set nowrap
set ignorecase smartcase incsearch
set noswapfile
set nobackup
set undodir =~/.vim/undodir2
set undofile
set scrolloff=8
set updatetime=50
set termguicolors
set nohlsearch
set completeopt=menu,menuone,noselect

" 80 character limit column
set colorcolumn=80
set signcolumn=yes
highlight Colorcolumn guibg=lightgrey

" set up plugins 
call plug#begin('~/.config/nvim/plugged')

Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'vimwiki/vimwiki'
Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-telescope/telescope.nvim'
Plug 'RishabhRD/nvim-lsputils'
Plug 'RishabhRD/popfix'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'mfussenegger/nvim-jdtls'
Plug 'tpope/vim-fugitive'

call plug#end()

" set colorscheme and background
colorscheme gruvbox
highlight Normal guibg=none

" lets
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']

" jdtls setup
lua require'lspconfig'.jdtls.setup{ cmd = { "jdtls" } }

command! -buffer JdtCompile lua require('jdtls').compile()


lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

" setting up telescope
lua <<EOF
local actions = require("telescope.actions")
require('telescope').setup {
  defaults = {
    mappings = {
      i = { 
        ["qq"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-h>"] = actions.preview_scrolling_up,
        ["<C-l>"] = actions.preview_scrolling_down,
      }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    
      override_generic_sorter = true,
      override_file_sorter = true,   
      case_mode = "smart_case",     
    }
  }
}
EOF

lua require('telescope').load_extension('fzf')

" cmp setup
lua <<EOF
local cmp = require'cmp'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
cmp.setup({
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-h>'] = cmp.mapping.scroll_docs(-4),
    ['<C-l>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.complete() and cmp.mapping.close(),
    ['<ESC>'] = cmp.mapping.close()
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }
})
EOF

" jdtls setup
augroup lsp
  au!
  au FileType java lua require'jdtls_config'.setup()
  au FileType python lua require'pyright_set'.setup()
augroup end

" python / pyright with lsp
lua << EOF
require'lspconfig'.pyright.setup{}
EOF

" Telescope remap
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

 "undo tree
nnoremap <leader>u :UndotreeShow<CR>

" utility remaps
imap jj <esc>
nnoremap H ^
nnoremap L $
nnoremap <c-i> <C-^>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <c-j> :bp<CR>
nnoremap <c-k> :bn<CR>

" new remaps from primagen video
nnoremap Y yg_
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" remap for opening file's directory in a split and for opening a terminal 
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>tt :sp<bar>term<cr><c-w>J:resize10<cr>

" visual remap for printing
vnoremap <leader>p "_dP<CR>

" terminal remap
tnoremap <leader>jj <C-\><C-n>

" command mode remaps
set wildcharm=<Tab>
cnoremap <C-j> <Tab>
cnoremap <C-k> <Tab><S-Tab><S-Tab>
cnoremap <C-h> <up>
cnoremap <C-l> <down>
