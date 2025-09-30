syntax on
filetype plugin on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2

set expandtab
set smartindent

set number relativenumber

set nowrap
set smartcase
set noswapfile
set incsearch
set backspace=indent,eol,start

set mouse=a

set hidden

set colorcolumn=80
set background=dark
colorscheme slate

set splitbelow
set splitright

" Wild menu
set wildmenu
set wildoptions+=pum

let mapleader="\<Space>"
nnoremap <leader>w :w<CR>
nnoremap <leader>o :so<CR>

" Trim trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Netrw
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Persistent undo
if has('persistent_undo')
    let target_path = expand('~/.config/vim-persisted-undo/')
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    let &undodir = target_path
    set undofile
endif

" Status line
set laststatus=2
set statusline=%f "tail of the filename
