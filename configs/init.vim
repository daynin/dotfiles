call plug#begin('~/.vim/plugged')
"common
"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'thinca/vim-quickrun'
Plug 'neomake/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cohama/agit.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript'] }
Plug 'othree/html5.vim', { 'for': ['html', 'javascript'] }
Plug 'tpope/vim-haml', { 'for': 'haml'}
"CSS/LESS/Stylus/SCSS
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less', 'stylus'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
"Jade
Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] }
"JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }
Plug 'wizicer/vim-jison', { 'for': 'jison' }
Plug 'posva/vim-vue', { 'for': ['javascript', 'typescript'] }
"Go lang
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'nsf/gocode',  { 'for': 'go' }
"Ruby
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
"Python
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'mitsuhiko/vim-python-combined', { 'for': 'python' }
"CoffeScript
Plug 'kchmck/vim-coffee-script', { 'for': 'coffescript' }
"TypeScript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'clausreinke/typescript-tools.vim', { 'do': 'npm install', 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript'}
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
"Clojure and ClojureScript
Plug 'tpope/vim-fireplace', { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-clojure-static', { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-clojure-highlight', { 'for': ['clojure', 'clojurescript'] }
Plug 'vim-scripts/paredit.vim', { 'for': ['clojure', 'clojurescript'] }
"Rust
Plug 'wting/rust.vim', { 'for': 'rust' }
"C / C++
Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp'] }
"PHP
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
"Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
"Elm
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
"CPP
Plug 'zchee/deoplete-clang', { 'for': ['cpp', 'cc', 'c'] }
Plug 'tweekmonster/deoplete-clang2'
Plug 'justmao945/vim-clang'
"Themes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
"Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
"TOML
Plug 'cespare/vim-toml', { 'for': 'toml' }
call plug#end()

" Settings
set autoread
syntax enable
set t_Co=256

colorscheme gruvbox
set background=dark

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h14

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number

set nocursorline
set nocursorcolumn
syntax sync minlines=256

set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set cmdheight=1 " command bar height

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

set nocompatible " not compatible with vi

" make backspace behave in a sane manner
set backspace=indent,eol,start
"find a word

" set a map leader for more key combos
let g:mapleader = ','
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <C-f> :Ag -Q "

" Use deoplete.
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"

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
set showmatch " show matching braces

" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_typescript_enabled_makers = ['tslint']
let g:neomake_css_enabled_makers = ['stylelint']
let g:neomake_javascript_enabled_makers = ['eslint']

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
au BufRead,BufNewFile *.tl setfiletype lisp

"react settings
let g:jsx_ext_required = 0

" nvim setup
" workaround for https://github.com/neovim/neovim/issues/2048
if has('nvim')
  nmap <BS> <C-W>h
 endif

"Python settings
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_virtualenv = 1
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

"Haskell settings
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1

"Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>i <Plug>(go-info)
"TypeScript
au FileType typescript nmap <leader>g :TsuDefinition<cr>:TsuDefinition<cr>
au FileType typescript nmap <leader>b :TsuGoBack<cr>
let g:tsuquyomi_disable_quickfix = 1
