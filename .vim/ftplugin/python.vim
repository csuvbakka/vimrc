set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let NERDTreeIgnore=['\.pyc$', '\~$']

let python_highlight_all=1
colorscheme kalisi
set background=dark
syntax on

map <F5> :w<CR>:cd %:p:h<CR>:!python %<CR>
" map <leader>q :lclose<CR>
map <leader>n :lnext<CR>
map <leader>p :lprevious<CR>
