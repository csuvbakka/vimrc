colorscheme railscasts

"---------------------------------------------------------------------------
" Vundle
"---------------------------------------------------------------------------
filetype off "required by Vundle
let g:vundle_default_git_proto = 'git' "makes Vundle use `git` instead default `https`

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'vim-scripts/a.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'

call vundle#end()

"--------------------------------------------------------------------------"
"                                                                          "
"                             General settings                             "
"                                                                          "
"--------------------------------------------------------------------------"
"---------------------------------------------------------------------------
" Comfort
"---------------------------------------------------------------------------
filetype plugin indent on

set tabstop=4    "number of spaces that a <Tab> counts for
set shiftwidth=4 "number of spaces to use for each step of (auto)indent
set expandtab    "use the appropriate number of spaces to insert a <Tab>

set nocompatible               "make Vim behave in a more useful way
set shellcmdflag=-cf           "pass -cf flags to shell commands
set ignorecase                 "smartcase is used only if this is on
set smartcase                  "smart searching
set nu                         "show line numbers
set autoindent                 "turn on autoindent
set hlsearch                   "highlight searches
set laststatus=2               "always display status line
set scrolloff=5                "keep 5 lines above and below the cursor
set nobackup                   "do not create backup file
set noswapfile                 "do not create swap file
set completeopt=menu           "do not show preview window
set backspace=indent,eol,start "do not use vi compatible backspace

syntax on

"remember last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"automatically source .vimrc after modifying it
"if has("autocmd")
"  autocmd BufWritePost .vimrc source $MYVIMRC
"endif

"---------------------------------------------------------------------------
" Mappings
"---------------------------------------------------------------------------
let mapleader = ","

nnoremap n nzz
nnoremap N Nzz

"list buffers and select one
nnoremap <leader>b :ls<cr>:b<space>

"split vertically and move to new window
nnoremap <leader>w <C-w>v<C-w>l
"close window
" nnoremap <leader>q <C-w>c
"close all windows but the current one
nnoremap <leader>o <C-w>o

"open .vimrc
nnoremap <leader>v :edit $MYVIMRC<CR>

"press <Shift-Space> in normal mode to toggle search highlighting
nnoremap <S-Space> :set hlsearch! hlsearch?<CR>

"highlight all occurences of the word under the cursor when pressing <Space>
nnoremap <Space> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"use ,s for saving
nnoremap <leader>s :w<CR>

"use jk to get back to normal mode
inoremap jk <Esc>

" create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>j

" copy/paste from Windows
vnoremap <leader>y "+y
nnoremap <leader>y "+yw
nnoremap <leader>p "+p


nnoremap ,cs :let @*=expand("%")<CR>
nnoremap ,cl :let @*=expand("%:p")<CR>

" Ctrl + arrow to move between buffers
nnoremap <C-Right> :bn<CR>
nnoremap <C-Left> :bp<CR>


"---------------------------------------------------------------------------
" Session management
"---------------------------------------------------------------------------
function! SaveSession()
    call inputsave()
    let session_name = input('Session name: ')
    call inputrestore()
    exec "mksession! $HOME/.vim/session/" . session_name . ".vim"
endfunction

function! LoadSession()
    call inputsave()
    let session_name = input('Session to load: ')
    call inputrestore()
    exec "source $HOME/.vim/session/" . session_name . ".vim"
endfunction

nnoremap <F12> :call SaveSession()<CR>
nnoremap <S-F12> :call LoadSession()<CR>



"--------------------------------------------------------------------------"
"                                                                          "
"                           Plugin specific settings                       "
"                                                                          "
"--------------------------------------------------------------------------"

"---------------------------------------------------------------------------
" YouCompleteMe
"---------------------------------------------------------------------------
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-k>']
let g:ycm_confirm_extra_conf = 0

let g:ycm_server_log_level = 'error'
"let g:ycm_server_log_level = 'debug'
"let g:ycm_server_use_vim_stdout = 1

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>f :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>


"---------------------------------------------------------------------------
" ListToggle
"---------------------------------------------------------------------------
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10


"---------------------------------------------------------------------------
" NERDTree
"---------------------------------------------------------------------------
let g:NERDTreeDirArrows=0 "old-school look
let g:NERDTreeMouseMode=2 "single click on directories, double on files to open

nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <S-F3> :NERDTreeFind<CR>


"---------------------------------------------------------------------------
" a.vim
"---------------------------------------------------------------------------
let g:alternateExtensions_cc = "hh"
let g:alternateExtensions_hh = "cc"
let g:alternateNoDefaultAlternate = 1
nnoremap <C-Tab> :A<CR>
nnoremap <C-S-Tab> :AV<CR>


"---------------------------------------------------------------------------
" vim-airline
"---------------------------------------------------------------------------
let g:airline_theme = 'ubaryd'


"---------------------------------------------------------------------------
" CtrlP
"---------------------------------------------------------------------------
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,max:40'
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_use_caching = 0

nnoremap <C-B> :CtrlPBuffer<CR>
nnoremap <C-F> :CtrlP<CR>


"---------------------------------------------------------------------------
" NERDCommenter
"---------------------------------------------------------------------------
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

map <leader>cc <plug>NERDCommenterToggle
map <leader>ci <plug>NERDCommenterInvert




"---------------------------------------------------------------------------
" DEBUG STUFF
"---------------------------------------------------------------------------
nnoremap <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


