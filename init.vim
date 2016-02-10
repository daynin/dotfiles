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
Plug 'jiangmiao/auto-pairs'
"HTML
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'tpope/vim-haml', { 'for': 'haml'}
Plug 'gregsexton/MatchTag', { 'for': 'html'}
Plug 'mattn/emmet-vim', { 'for': 'html'}
"CSS/LESS
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
"Jade
Plug 'digitaltoad/vim-jade'
"JavaScript
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }
Plug 'wizicer/vim-jison', { 'for': 'jison' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
"Color themes
Plug 'flazz/vim-colorschemes'
"Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
"Go lang
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'nsf/gocode', {'rtp': 'vim/'}
"Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
call plug#end()

" Settings
colorscheme hybrid
let mapleader=","

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number
set relativenumber

set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set scrolloff=3 " lines of text around cursor
set shell=$SHELL
set cmdheight=1 " command bar height

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" faster redrawing
set ttyfast

set nocompatible " not compatible with vi
set autoread " detect when a file is changed

" make backspace behave in a sane manner
set backspace=indent,eol,start
"find a word
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

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

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set showmatch " show matching braces

"Airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='bubblegum'

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

" workaround for https://github.com/neovim/neovim/issues/2048
 if has('nvim')
     nmap <BS> <C-W>h
 endif

" Map ctrl-movement keys to window switching
map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>

" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
