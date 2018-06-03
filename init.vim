call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tweekmonster/deoplete-clang2'
Plug 'sbdchd/neoformat'

Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()


"---------------------------------------------------------------------------
" Comfort
"---------------------------------------------------------------------------
set tabstop=4    "number of spaces that a <Tab> counts for
set shiftwidth=4 "number of spaces to use for each step of (auto)indent
set expandtab    "use the appropriate number of spaces to insert a <Tab>

set smartcase            "smart searching
set number               "show line numbers
set autoindent           "turn on autoindent
set hlsearch             "highlight searches
set incsearch            "incremental search
set scrolloff=5          "keep 5 lines above and below the cursor
set relativenumber       "relative line numbering
set completeopt-=preview "do not show preview window

set background=dark
colorscheme gruvbox


"---------------------------------------------------------------------------
" Mappings
"---------------------------------------------------------------------------
let mapleader = ","

nnoremap n nzz
nnoremap N Nzz

"split vertically and move to new window
nnoremap <leader>w <C-w>v<C-w>w

"open .vimrc
nnoremap <leader>v :edit ~/.config/nvim/init.vim<CR>

"use ,s for saving
nnoremap <leader>s :w<CR>

"use jk to get back to normal mode
inoremap jk <Esc>

" create newlines like o and O but stay in normal mode
nnoremap <leader>j o<Esc>k
nnoremap <leader>k O<Esc>j
nnoremap <leader>o i<CR><Esc>

" Ctrl + l/h to move between buffers
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>

nnoremap <leader>r :Neoformat<CR>



" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Pass a dictionary to set multiple options
call deoplete#custom#option({
\ 'max_list': 20,
\ 'smart_case': v:true,
\ 'min_pattern_length': 1,
\ })
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" : deoplete#manual_complete()

let g:deoplete#sources#clang#clang_complete_database = 'build'

