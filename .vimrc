" Plugin Management
call plug#begin('~/.vim/autoload/plugged')
" Load Plugins via GIT
    "Plug 'https://github.com/tomasiser/vim-code-dark.git'
    "Plug 'https://github.com/vim-syntastic/syntastic.git'
    "Plug 'https://github.com/junegunn/vim-easy-align'

" Load plugins manually 
    Plug '~/.vim/autoload/plugged/vim-code-dark'
    Plug '~/.vim/autoload/plugged/syntastic'
    Plug '~/.vim/autoload/plugged/vim-easy-align'
call plug#end()

set number
set relativenumber
set ls=2
set tabstop=4
set shiftwidth=4
set expandtab
set ttyfast
set tw=0
set textwidth=0
set wrapmargin=0
set autoread "reload files that have changed

"set tw=100 "don't let code lines go over 100 chars
" set wrap linebreak "insert newline for text wrapping
" t flag to linewrap comments, same for c flag
" r flag to not add comment starts when hitting enter
" o flag to not add comment starts when hitting o/O
"autocmd FileType * setlocal fo+=t fo-=r fo+=c fo-=o
autocmd FileType * setlocal fo-=r fo-=o
"set formatoptions-=t
map <C-a> <Home>
map <C-e> <End>
imap <C-a> <Home>
imap <C-e> <End>
"let g:syntastic_verilog_checkers = ['iverilog']
"let g:syntastic_verilog_checkers = ['verilator']
let g:syntastic_vhdl_checkers = ['vcom']
let g:syntastic_vhdl_vcom_args="-work ~/syntastic_sv/work"
let g:syntastic_verilog_checkers = ['vlog']
let g:syntastic_verilog_vlog_args="-work ~/syntastic_sv/work"
let g:syntastic_systemverilog_checkers = ['vlog']
let g:syntastic_systemverilog_vlog_args="-sv -work ~/syntastic_sv/work"
let g:syntastic_quiet_messages = { "regex": ['not found in library "work"', 'has changed and must be reanalysed', 'was not analysed', '.h: No such file or directory', 'Extra checking for conflicts with always_comb and always_latch variables is done at vopt time'] }
let g:syntastic_vhdl_ghdl_args = "--std=08 -frelaxed"
set clipboard=unnamedplus
set ttimeoutlen=100
set t_Co=256
set t_ut=y
colorscheme codedark
"highlight current tab text to be red
hi TabLineSel ctermfg=Red
"map 'ga' to use easy-align tool
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
