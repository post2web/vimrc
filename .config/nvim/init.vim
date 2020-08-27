set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" syntastic checking
Plugin 'vim-syntastic/syntastic'

" auto complete
Plugin 'terryma/vim-expand-region'

" auto close pairs
Plugin 'jiangmiao/auto-pairs'

" syntax file for Docker's Dockerfile
Plugin 'ekalinin/Dockerfile.vim'

" nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" add git indication of diff
Plugin 'mhinz/vim-signify'

" tabular edit
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" wiki
Plugin 'vimwiki/vimwiki'
Plugin 'machakann/vim-highlightedyank'


Plugin 'vim-scripts/indentpython.vim'

Plugin 'mileszs/ack.vim'

" gc 
Plugin 'tpope/vim-commentary'

Plugin 'yuttie/comfortable-motion.vim'

Plugin 'overcache/NeoSolarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Reload ~/.vimrc
" :so ~/.vimrc
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Enable fzf inside vim
set rtp+=/usr/local/opt/fzf

" NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

filetype on
" set leader
let mapleader = ","
" set copy paste:
set mouse=a
"set clipboard=unnamed,autoselect
set clipboard=unnamed
set guioptions+=a


" spelling
set spell spelllang=en_us

" set python handling
set number
syntax on

" theme
"let g:gruvbox_contrast_light='hard'
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

set termguicolors

" https://github.com/overcache/NeoSolarized
let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "high"
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set background=dark
colorscheme NeoSolarized


" Show already typed keys when more are expected.
set showcmd                

" Highlight while searching with / or ?.
set incsearch              
" Keep matches highlighted.
set hlsearch               

" Faster redrawing.
set ttyfast                
" Only redraw when necessary.
set lazyredraw             

" Open new windows below the current window.
set splitbelow             
" Open new windows right of the current window.
set splitright             

" virtual column
set colorcolumn=81

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =600       " Only highlight the first n columns.

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

" to delete older text
set backspace=indent,eol,start
set hidden                 " Switch between buffers without having to save first.
set display     =lastline  " Show as much as possible of the last line.

autocmd BufWritePre *.py %s/\s\+$//e

" show the matching part of the pair for [] {} and ()
set showmatch

" syntax checking settings:
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_loc_list_heighti = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = "--ignore E121,E123,E126,E226,E24,E704,W503,W504,E111,E114 --max-line-length 81"

let python_highlight_all = 1

function ChangeIdent()
  set ts=4
  set noet
  %retab!  
  set ts=2
  set et
  %retab!
  let g:pymode_trim_whitespace = 0
endfunction

" setup vim file explore https://shapeshed.com/vim-netrw/#netrw-the-unloved-directory-browser
let g:netrw_liststyle = 3

" in order to preserve color scheme set here in macvim
let macvim_skip_colorscheme=1

" kite
let g:kite_tab_complete=1
" To have the preview window automatically closed once a completion has been inserted:
" set belloff+=ctrlg  " if vim beeps during completion
" set completeopt-=preview

" statusline
set statusline=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" Smooth-scroll 
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 20)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 20)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 40)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 40)<CR>


" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:highlightedyank_highlight_duration = 500

set shiftwidth=4
set autoindent
set expandtab

if has('nvim')
        tnoremap <Esc> <C-\><C-n>
        " paste the selection in the window below, run it and come back
        nnoremap <Leader>e <C-W>ji<C-c>%paste<ENTER><C-\><C-n><C-W>w
        " copy all lines, paste the selection in the window below, run it and come back
        nnoremap <Leader>r :%y+<CR><C-W>ji<C-c>%paste<ENTER><C-\><C-n><C-W>w
        tnoremap <A-\> <Esc>
        " to make the insert mode cursor visible in normal mode
        hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE
endif


"-- QUICK MOVEMENTS ON INSERT MODE --
"single movements h j k l
noremap! <Leader>h <left>
noremap! <Leader>j <down>
noremap! <Leader>k <up>
noremap! <Leader>l <right>
"append shortcuts
noremap! <Leader>A <esc>A
noremap! <Leader>a <esc>a
"new line and insert shortcuts
noremap! <Leader>O <esc>O
noremap! <Leader>o <esc>o
