" quite basic vim config

" install if needed (syntax checking)
" https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers
"
" clang
" ansible-lint
" csslint
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins using vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map , on <leader>
let mapleader = ","

"fast saving
nnoremap <leader>w :w<cr>

"mode changing

"spell checking
set spelllang=cs,en,ru
noremap <leader>sp :setlocal spell!<cr>

"paste mode toggle
noremap <leader>pp :setlocal paste!<cr>

"save backup and swap files to one directory
set backupdir=~/.vim/tmp
set directory=~/.vim/swap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"enable synstax highlighting
syntax enable

set number
"show title in OS status line
set title
set confirm

colorscheme mustang
set t_Co=256

"command line completion
set wildmenu
set wildmode=longest,list
set wildignore=*.o,*~,.swp

"show current position
set ruler

"highlight matching brackets for x tenths of second
set showmatch
set matchtime=2

"show line on 80 chars
set colorcolumn=80
highlight ColorColumn ctermbg=DarkGray guibg=DarkGray

"no errors sounds...
set novisualbell
set noerrorbells

"show cmd being executed (or number of lines in visual selection...)
set showcmd

"search as chars are typed, if search uppercase, be case sensitive, highlight
set incsearch
set hlsearch
set ignorecase
set smartcase
"hide highlight when enter is pressed
nnoremap <CR> :nohlsearch<CR><CR>

"number of lines around cursor
set scrolloff=5
set sidescrolloff=10

"set workdir to the currently edited file dirs
set autochdir

"reload when file is changed externally
"set autoread

"current buffer can be put into background without saving
set hidden

"keep longer history
set history=500

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax, folding, wrapping, indent...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"folding stuff
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=3

"toggle fold
nnoremap <space> za
" save folding when closing the file and restore when opening
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

"wrap visually only
set wrap
set showbreak=>
set linebreak
"uncomment to set hard wrapping
"set textwidth=80

"higlight extra whitespaces, errors like space folowed by tab...
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$\| \+\ze\t/

"autoremove trailing whitespaces when saving
autocmd BufWritePre * :%s/\s\+$//e

"match also other tags and brackets with % (html)
runtime macros/matchit.vim

"clever indent
set cindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compiling, debugging...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"compile button and moving around errors
noremap <F5> :w<cr>:make<cr>
noremap <F6> :cp<cr>
noremap <F7> :cn<cr>
noremap <F8> :cl<cr>

"or more vim like keybindings
noremap cn <esc>:cn<cr>
noremap cp <esc>:cp<cr>
noremap cl <esc>:clist<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" moving around, tabs, windows, buffers...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"unset arrows - force myself to use hjkl instead
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

"move vertically without skipping long visually wrapped lines
nnoremap j gj
nnoremap k gk

"tabs shortcuts
noremap <leader>tn :tabnew
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove
"fill path to the current buffer's dir to tabedit
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"next/prev tab
noremap <C-up> gt
noremap <C-down> gT

"buffers
noremap <leader>be :e
noremap <leader>bd :bdelete<cr>
noremap <C-left> :bprev<cr>
noremap <C-right> :bnext<cr>
noremap <C-j> :bprev<cr>
noremap <C-k> :bnext<cr>

"write with sudo
cmap w!! w !sudo tee > /dev/null %

"swap letters
nnoremap <silent> gs xph

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugins shortcuts
noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>v :Tagbar<cr>
noremap <leader>l :ToggleBufExplorer<cr>

"youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data   = ['&filetype']

"delimitMate
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

"ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers = ['w3']

"autocompletion
"activate by ctrl-space
set omnifunc=syntaxcomplete#Complete

"au FileType php setl ofu=phpcomplete#CompletePHP
"au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
"au FileType c setl ofu=ccomplete#Complete
"au FileType css setl ofu=csscomplete#CompleteCSS
"au FileType python setl ofu=pythoncomplete#Complete
"au FileType javascript setl ofu=javascriptcomplete#CompleteJS
"au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"file format for asm and inc files set to microchip pic
au BufNewFile,BufRead *.asm set filetype=pic | let g:ycm_auto_trigger=0
au BufNewFile,BufRead *.inc set filetype=pic | let g:ycm_auto_trigger=0
au BufNewFile,BufRead *.yml set filetype=yaml.ansible
