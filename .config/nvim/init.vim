
set number relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smartcase
set noswapfile
set incsearch
set nohlsearch
set backspace=indent,eol,start
set mouse=a
set signcolumn=yes
set nowrap
set splitright

" Trim trailing whitespaces on write
autocmd BufWritePre * :%s/\s\+$//e
call plug#begin()
" Colorscheme
Plug 'sainnhe/everforest'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

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

" Fuzzy Finder
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

" Status bar
Plug 'nvim-lualine/lualine.nvim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'preservim/nerdtree'

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


if has('termguicolors')
  set termguicolors
endif

let g:everforest_background = 'medium'
let g:everforest_better_performance = 1
let g:everforest_transparent_background= 1
let g:airline_theme = 'everforest'
set background=dark
let g:tokyonight_style = 'night'
let g:tokyonight_transparent = 1

colorscheme tokyonight

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap <leader>fw <cmd>Telescope grep_string<cr>
packadd cfilter

" Configure GitGutter
set updatetime=100

" Git Gutter
nnoremap <leader>pc <Cmd>GitGutterPreviewHunk<CR>

" TreeSitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

" lsp snippet
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

