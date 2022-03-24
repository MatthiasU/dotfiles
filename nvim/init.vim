
set number relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
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
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'

Plug 'bfrg/vim-cpp-modern/'
call plug#end()

let mapleader="\<Space>"
nnoremap <leader>w :w<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>b] :bnext<cr>
nnoremap <leader>b[ :bprev<cr>

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

set background=dark
colorscheme everforest

" FZF
let g:fzf_preview_window = ['right:50', 'ctrl-\']
let g:fzf_layout = { 'down': '~20%' }
nnoremap <leader>ff <cmd>Files<cr>
nnoremap <leader>gf <cmd>GFiles<cr>
nnoremap <leader>fb <cmd>Buffers<cr>

" Terminal
tnoremap <Esc> <C-\><C-n>
cabbrev bterm bo term

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

 "Commenter mapping
" <leader>c<space> toggle
" Configure GitGutter
set updatetime=100

" Git Gutter
nnoremap <leader>pc <Cmd>GitGutterPreviewHunk<CR>

" Editor config plugin
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
