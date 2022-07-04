
set number relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set noswapfile
set incsearch
set backspace=indent,eol,start
set mouse=a
set signcolumn=yes
set nowrap
set splitright

" Trim trailing whitespaces on write
autocmd BufWritePre * :%s/\s\+$//e

call plug#begin()
Plug 'sainnhe/everforest'
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'airblade/vim-gitgutter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

let mapleader="\<Space>"

" navigating between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

lua require('lsp_config')
autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()

set background=dark
colorscheme everforest

" FZF
let g:fzf_preview_window = ['right:40%:hidden', 'ctrl-/']
let g:fzf_layout = { 'down': '~20%' }
nnoremap <leader>ff <cmd>Files<cr>
nnoremap <leader>gf <cmd>GFiles<cr>
nnoremap <leader>fb <cmd>Buffers<cr>

" Configure GitGutter
set updatetime=100

" Git Gutter
nnoremap <leader>pc <Cmd>GitGutterPreviewHunk<CR>

