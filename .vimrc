set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

set guifont=Monaco:h16
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\

set nocompatible              " be iMproved
filetype off                  " required!

syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=0
set term=screen-256color
set t_Co=256
let g:rehash256 = 1
colorscheme Monokai-chris


" let Vundle manage Vundle
" required! 
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'git://github.com/tpope/vim-fugitive.git'
Plugin 'Lokaltog/powerline'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'wizicer/vim-jison'


:set laststatus=2
let g:syntastic_check_on_open=1

"HTML
Plugin 'git://github.com/othree/html5.vim.git'
Plugin 'git://github.com/hokaccha/vim-html5validator.git'
Plugin 'git://github.com/tpope/vim-haml.git'
Plugin 'git://github.com/gregsexton/MatchTag.git'
"CSS/LESS
Plugin 'git://github.com/hail2u/vim-css3-syntax.git'
Plugin 'git://github.com/ap/vim-css-color.git'
Plugin 'git://github.com/groenewege/vim-less.git'
Plugin 'git://github.com/miripiruni/vim-better-css-indent.git'
Plugin 'git://github.com/miripiruni/CSScomb-for-Vim.git'
"JavaScript
Plugin 'git://github.com/pangloss/vim-javascript.git'
Plugin 'git://github.com/itspriddle/vim-jquery.git'
Plugin 'git://github.com/walm/jshint.vim.git'
Plugin 'https://github.com/jiangmiao/auto-pairs'
"Snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
"Color themes
Bundle "altercation/vim-colors-solarized"

set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

:let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
:let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

:imap <A-;> <Esc>
:set tabstop=4 
:set expandtab
:set shiftwidth=4
:set autoindent
:set smartindent
:set cindent
:set number
:set noswapfile

:highlight Pmenu guibg=gray gui=bold
:set guioptions-=T
:set guioptions-=r
:set lines=45 columns=100

" Warning: nightmare mode!
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map <C-n> :NERDTreeToggle<CR>
" Navigate with <Alt>-hjkl in Insert mode
"set timeout
set timeoutlen=1000
"set ttimeout
set ttimeoutlen=50

map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

call vundle#end()
filetype plugin indent on
