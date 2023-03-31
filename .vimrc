" Plugin Management
call plug#begin('~/.vim/autoload/plugged')
" Load Plugins via GIT
    "Plug 'https://github.com/tomasiser/vim-code-dark.git'
    "Plug 'https://github.com/vim-syntastic/syntastic.git'
    "Plug 'https://github.com/junegunn/vim-easy-align'

" Load plugins manually 
    Plug '~/.vim/autoload/plugged/vim-code-dark'
    Plug '~/.vim/autoload/plugged/ale'
    "Plug '~/.vim/autoload/plugged/syntastic'
    Plug '~/.vim/autoload/plugged/vim-easy-align'
    Plug '~/.vim/autoload/plugged/tabular'
    Plug '~/.vim/autoload/plugged/vim-indent-object'
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

set tw=100 "don't let code lines go over 100 chars
 set wrap linebreak "insert newline for text wrapping
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

let g:ale_linters = {'verilog': ['vlog'], 'systemverilog': ['vlog'], 'fortran': []}
"let g:ale_linters = {'verilog': ['vlog'], 'systemverilog': ['verilator'], 'fortran': []}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_verilog_vlog_options = '-suppress vlog-13233 -quiet -lint -work ~/ale_sv/work ' . system('monolith')
let g:ale_systemverilog_vlog_options = '-suppress vlog-13233 -sv -quiet -lint -work ~/ale_sv/work ' . system('monolith')

" glob all 'include' directories under the current repository
"let custom_cc_include_paths = system('monolith include')
let custom_cc_include_paths = ""

" include them so ALE will work
let g:ale_c_cc_options = '-Wall' . ' ' . custom_cc_include_paths

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

set t_BE=
set backspace=indent,eol,start
set hlsearch

let b:match_words = '\<task\>:\<endtask\>, \<begin\>:\<end\>, \<fork\>:\<join\>, \<case\>:\<endcase\>'
let b_verilog_indent_verbose = 1

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


filetype plugin indent on

autocmd BufRead,BufNewFile *.f setlocal syntax=OFF
autocmd BufRead,BufNewFile *.h,*.c set filetype=c
autocmd BufRead,BufNewFile,BufReadPost *Makefile.* set filetype=make


nmap gf <C-W>gf

"nmap Zio vip :s/input/dnput/<CR> vip :s/output/input /<CR> vip :s/dnput /output/<CR>
"nmap Zio vip:s/\v(input \|output)/\={'input ':'output','output':'input '}[submatch(0)]/g<CR>:noh<CR>
nmap Zio vip:s/\v(input \|output)/\={'input ':'output','output':'input '}[submatch(0)]/g<CR>:noh<CR>

nmap Zh i//<Esc>98a-<Esc>yyPo<Esc>i// 
nmap Zm ZhMODULE<Esc>)omodule MODULE #(<CR>)(<CR>);<CR>endmodule<Esc>

nmap Zff oalways_ff @(posedge clk or negedge rst_n) begin<CR>if(!rst_n) begin<CR>end<CR>else begin<CR>end<CR>end<CR><Esc>(
nmap Z== gg=G

nmap Zpa vii:Tab/(<Esc>gv:s/ ( /(<CR>

"nmap Zdc vip:s/ *\/\/.*$//<CR>(:noh<CR>
"nmap Zaa gaip<Space>gaip-<Space>

nmap Zdc vip:s/ *\/\/.*$//<CR>(:noh<CR>
nmap Zaa vipga<Space>vipga-<Space>

map  <Esc>[1;5A <C-Up>
map  <Esc>[1;5B <C-Down>
map  <Esc>[1;5D <C-Left>
map  <Esc>[1;5C <C-Right>
cmap <Esc>[1;5A <C-Up>
cmap <Esc>[1;5B <C-Down>
cmap <Esc>[1;5D <C-Left>
cmap <Esc>[1;5C <C-Right>

map  <Esc>[1;2D <S-Left>
map  <Esc>[1;2C <S-Right>
cmap <Esc>[1;2D <S-Left>
cmap <Esc>[1;2C <S-Right>
