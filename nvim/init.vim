
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

" Trim trailing whitespaces on write
autocmd BufWritePre * :%s/\s\+$//e

call plug#begin()
Plug 'sainnhe/everforest'
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'akinsho/toggleterm.nvim'

Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

let mapleader="\<Space>"
nnoremap <leader>w :w<CR>
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

set background=dark
colorscheme everforest

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>fs :lua require'telescope.builtin'.lsp_dynamic_workspace_symbols{}<CR>

" Toggle Terminal
lua require('toggle_term_config')

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
