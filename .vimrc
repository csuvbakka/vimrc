map <F1> <Esc>

"---------------------------------------------------------------------------
" Vundle
"---------------------------------------------------------------------------
set nocompatible "make Vim behave in a more useful way
filetype off "required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/a.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'python.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'Shougo/unite.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'SirVer/ultisnips'
Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
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

set shellcmdflag=-cf           "pass -cf flags to shell commands
set ignorecase                 "smartcase is used only if this is on
set smartcase                  "smart searching
set number                     "show line numbers
set autoindent                 "turn on autoindent
set hlsearch                   "highlight searches
set laststatus=2               "always display status line
set scrolloff=5                "keep 5 lines above and below the cursor
set nobackup                   "do not create backup file
set noswapfile                 "do not create swap file
set completeopt=menu           "do not show preview window
set backspace=indent,eol,start "do not use vi compatible backspace
set relativenumber "relative line numbering
set wildmenu "enable smart command line completion
set wildmode=full "make repeated presses cycle between all matching choices

syntax on
set background=light
set t_Co=256
" colorscheme solarized

"remember last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"---------------------------------------------------------------------------
" Mappings
"---------------------------------------------------------------------------
let mapleader = ","

nnoremap n nzz
nnoremap N Nzz

"split vertically and move to new window
nnoremap <leader>w <C-w>v<C-w>w

"open .vimrc
nnoremap <leader>v :edit ~/.vimrc<CR>

"press <Shift-Space> in normal mode to toggle search highlighting
nnoremap <S-Space> :set hlsearch! hlsearch?<CR>

"highlight all occurences of the word under the cursor when pressing <Space>
nnoremap <Space> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"use ,s for saving
nnoremap <leader>s :w<CR>

"use jk to get back to normal mode
inoremap jk <Esc>

" create newlines like o and O but stay in normal mode
nnoremap <leader>j o<Esc>k
nnoremap <leader>k O<Esc>j
nnoremap <leader>o i<CR><Esc>

" copy/paste from Windows
vnoremap <leader>y "+y
nnoremap <leader>y "+yw
nnoremap <leader>p "+p


nnoremap ,cs :let @*=expand("%")<CR>
nnoremap ,cl :let @*=expand("%:p")<CR>

" Ctrl + l/h to move between buffers
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>


"---------------------------------------------------------------------------
" Useful functions
"---------------------------------------------------------------------------
function! SaveSession()
    call inputsave()
    let session_name = input('Session name: ')
    call inputrestore()
    exec "mksession! ~/.vim/session/" . session_name . ".vim"
endfunction

function! LoadSession()
    call inputsave()
    let session_name = input('Session to load: ')
    call inputrestore()
    exec "source ~/.vim/session/" . session_name . ".vim"
endfunction

function! ToggleBackground()
    if (&background=="dark")
        :set background=light
    else
        :set background=dark
    endif
endfunction


"--------------------------------------------------------------------------"
"                                                                          "
"                           Plugin specific settings                       "
"                                                                          "
"--------------------------------------------------------------------------"

"---------------------------------------------------------------------------
" YouCompleteMe
"---------------------------------------------------------------------------
let g:ycm_collect_identifiers_from_tags_files = 0
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_confirm_extra_conf = 0
let g:ycm_warning_symbol = 'W'

" let g:ycm_server_log_level = 'error'
let g:ycm_server_log_level = 'debug'

nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
nnoremap <leader>a :YcmShowDetailedDiagnostic<CR>


"---------------------------------------------------------------------------
" UltiSnips
"---------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<leader>k"
let g:UltiSnipsJumpForwardTrigger="<leader>m"
let g:UltiSnipsJumpBackwardTrigger="<leader>j"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

let g:SuperTabDefaultCompletionType = '<leader>k'


"---------------------------------------------------------------------------
" NERDTree
"---------------------------------------------------------------------------
let g:NERDTreeDirArrows=0 "old-school look
let g:NERDTreeMouseMode=2 "single click on directories, double on files to open


"---------------------------------------------------------------------------
" a.vim
"---------------------------------------------------------------------------
let g:alternateExtensions_cc = "hh"
let g:alternateExtensions_hh = "cc"
let g:alternateNoDefaultAlternate = 1
nnoremap <leader>t :A<CR>
nnoremap <leader><leader>t :AV<CR>


"---------------------------------------------------------------------------
" vim-airline
"---------------------------------------------------------------------------
let g:airline_theme = 'ubaryd'
" let g:airline_theme = 'solarized'


"---------------------------------------------------------------------------
" Unite
"---------------------------------------------------------------------------
nnoremap <leader>b :Unite -start-insert -auto-resize -direction=belowright buffer<CR>
nnoremap <leader>l :Unite -start-insert -auto-resize -direction=belowright line<CR>
nnoremap <leader>f :Unite -start-insert -auto-resize -direction=belowright file bookmark<CR>


"---------------------------------------------------------------------------
" NERDCommenter
"---------------------------------------------------------------------------
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

map <leader>cc <plug>NERDCommenterToggle
map <leader>ci <plug>NERDCommenterInvert


"---------------------------------------------------------------------------
" unimpaired.vim
"---------------------------------------------------------------------------
" Bubble single lines
nmap <C-K> [e
nmap <C-J> ]e

" Bubble multiple lines
vmap <C-K> [egv
vmap <C-J> ]egv


"---------------------------------------------------------------------------
" vim-clang-format
"---------------------------------------------------------------------------
let g:clang_format#command = "clang-format-3.6"
let g:clang_format#style_options = {
    \ "Language" :        "Cpp",
    \ "AccessModifierOffset" : -4,
    \ "AlignAfterOpenBracket" : "true",
    \ "AlignEscapedNewlinesLeft" : "false",
    \ "AlignOperands" :   "true",
    \ "AlignTrailingComments" : "true",
    \ "AllowAllParametersOfDeclarationOnNextLine" : "true",
    \ "AllowShortBlocksOnASingleLine" : "true",
    \ "AllowShortCaseLabelsOnASingleLine" : "false",
    \ "AllowShortIfStatementsOnASingleLine" : "false",
    \ "AllowShortLoopsOnASingleLine" : "false",
    \ "AllowShortFunctionsOnASingleLine" : "Inline",
    \ "AlwaysBreakAfterDefinitionReturnType" : "false",
    \ "AlwaysBreakTemplateDeclarations" : "false",
    \ "AlwaysBreakBeforeMultilineStrings" : "false",
    \ "BreakBeforeBinaryOperators" : "None",
    \ "BreakBeforeTernaryOperators" : "true",
    \ "BreakConstructorInitializersBeforeComma" : "true",
    \ "BinPackParameters" : "true",
    \ "BinPackArguments" : "true",
    \ "ColumnLimit" :     80,
    \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "false",
    \ "ConstructorInitializerIndentWidth" : 4,
    \ "DerivePointerAlignment" : "false",
    \ "ExperimentalAutoDetectBinPacking" : "false",
    \ "IndentCaseLabels" : "true",
    \ "IndentWrappedFunctionNames" : "false",
    \ "IndentFunctionDeclarationAfterType" : "false",
    \ "MaxEmptyLinesToKeep" : 1,
    \ "KeepEmptyLinesAtTheStartOfBlocks" : "true",
    \ "NamespaceIndentation" : "None",
    \ "PenaltyBreakBeforeFirstCallParameter" : 19,
    \ "PenaltyBreakComment" : 300,
    \ "PenaltyBreakString" : 1000,
    \ "PenaltyBreakFirstLessLess" : 120,
    \ "PenaltyExcessCharacter" : 1000000,
    \ "PenaltyReturnTypeOnItsOwnLine" : 60,
    \ "PointerAlignment" : "Left",
    \ "SpacesBeforeTrailingComments" : 1,
    \ "Cpp11BracedListStyle" : "true",
    \ "Standard" :        "Cpp11",
    \ "IndentWidth" :     4,
    \ "TabWidth" :        4,
    \ "UseTab" :          "Never",
    \ "BreakBeforeBraces" : "Allman",
    \ "SpacesInParentheses" : "false",
    \ "SpacesInSquareBrackets" : "false",
    \ "SpacesInAngles" :  "false",
    \ "SpaceInEmptyParentheses" : "false",
    \ "SpacesInCStyleCastParentheses" : "false",
    \ "SpaceAfterCStyleCast" : "false",
    \ "SpacesInContainerLiterals" : "true",
    \ "SpaceBeforeAssignmentOperators" : "true",
    \ "SpaceBeforeParens" : "ControlStatements",
    \ "DisableFormat" :   "false"}

let g:clang_format#auto_format = 1
" let g:clang_format#auto_format_on_insert_leave = 1


"---------------------------------------------------------------------------
" F key mappings
"---------------------------------------------------------------------------
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <S-F3> :NERDTreeFind<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <F8> :set foldmethod=syntax<CR>
nnoremap <F11> :call ToggleBackground()<CR>
nnoremap <F12> :call SaveSession()<CR>
nnoremap <S-F12> :call LoadSession()<CR>


"---------------------------------------------------------------------------
" DEBUG STUFF
"---------------------------------------------------------------------------
" nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


