call plug#begin('~/.vim/plugged')
"common
Plug 'Valloric/YouCompleteMe'
Plug 'gmarik/Vundle.vim'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'editorconfig/editorconfig-vim'
"HTML
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'gregsexton/MatchTag'
Plug 'mattn/emmet-vim'
"CSS/LESS
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
"JavaScript
Plug 'jiangmiao/auto-pairs'
Plug 'maksimr/vim-jsbeautify'
Plug 'wizicer/vim-jison'
Plug 'jelera/vim-javascript-syntax'
"Color themes
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'tomasr/molokai'
"Markdown
Plug 'plasticboy/vim-markdown'
"Go lang
Plug 'fatih/vim-go'
Plug 'nsf/gocode', {'rtp': 'vim/'}
"Jade
Plug 'digitaltoad/vim-jade'
call plug#end()

" Settings
colorscheme hybrid
let mapleader=","

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number

set noerrorbells                " No beeps
set novisualbell
set noswapfile                  " Don't use swapfile
set nobackup                   " Don't create annoying backup files
set splitright                  " Split vertical windows right to the current
"windows
set splitbelow                  " Split horizontal windows below to the
"current windows
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

""http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
" works only for OS X
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  set clipboard^=unnamed
  set clipboard^=unnamedplus"
endif

"Search highlighting
hi Search guibg=peru guifg=wheat
hi Search ctermfg=yellow ctermbg=blue
set hlsearch
set incsearch
set guioptions-=T
set guioptions-=r

"Airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='badwolf'

" Warning: nightmare mode!
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"Open NERDTree with Ctrl-n
map <C-n> :NERDTreeToggle<CR>
"set timeout
set timeoutlen=1000
"set ttimeout
set ttimeoutlen=50

"Emmet settings
let g:user__install_global = 0
autocmd FileType html,css EmmetInstall

"Beautify js, html, css with ctrl-f
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType scss noremap <buffer> <c-f> :call CSSBeautify()<cr>
