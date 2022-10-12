syntax on

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

" highlight ColorColum ctermbg=0 guibg=lightgrey

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

" Trim trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Netrw

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Persistent undo

" guard for distributions lacking the 'persistent_undo' feature.
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.config/vim-persisted-undo/')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    " point Vim to the defined undo directory.
    let &undodir = target_path
    " finally, enable undo persistence.
    set undofile
endif

" Status line

set laststatus=2
set statusline=%f "tail of the filename
