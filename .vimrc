call plug#begin('~/.vim/autoload/plugged')
Plug 'https://github.com/tomasiser/vim-code-dark.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'
call plug#end()
set number
set relativenumber
set ls=2
set tabstop=4
set shiftwidth=4
set expandtab
set ttyfast
:map <C-a> <Home>
:map <C-e> <End>
:imap <C-a> <Home>
:imap <C-e> <End>

let g:syntastic_quiet_messages = { 'regex': 'not found in library "work"' }
let g:syntastic_quiet_messages = { 'regex': 'has changed and must be reanalysed' }

set clipboard=unnamedplus

set ttimeoutlen=100
set t_Co=256
set t_ut=y
colorscheme codedark
