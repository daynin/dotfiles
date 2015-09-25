set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'sickill/vim-monokai'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete.vim'
Plugin 'easymotion/vim-easymotion'
"Plugin 'scrooloose/syntastic'
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
Plugin 'editorconfig/editorconfig-vim'
"HTML
Plugin 'git://github.com/othree/html5.vim.git'
Plugin 'git://github.com/hokaccha/vim-html5validator.git'
Plugin 'git://github.com/tpope/vim-haml.git'
Plugin 'git://github.com/gregsexton/MatchTag.git'
Plugin 'mattn/emmet-vim'
"CSS/LESS
Plugin 'git://github.com/hail2u/vim-css3-syntax.git'
Plugin 'git://github.com/ap/vim-css-color.git'
Plugin 'git://github.com/groenewege/vim-less.git'
Plugin 'git://github.com/miripiruni/vim-better-css-indent.git'
Plugin 'git://github.com/miripiruni/CSScomb-for-Vim.git'
"JavaScript
Plugin 'git://github.com/pangloss/vim-javascript.git'
Plugin 'git://github.com/itspriddle/vim-jquery.git'
Plugin 'https://github.com/jiangmiao/auto-pairs'
"Snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
"Color themes
Bundle "altercation/vim-colors-solarized"
"Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Go lang
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
"Jade
Plugin 'digitaltoad/vim-jade'
call vundle#end()

"Settings
set nocompatible              " be iMproved, required
set shell=/bin/sh
set term=screen-256color
set t_Co=256
let g:rehash256 = 1
set background=dark
colorscheme monokai
let g:airline_theme='badwolf'

" set the runtime path to include Vundle and initialize
set guifont=Inconsolata\ for\ Powerline:h16
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\

syntax enable
filetype plugin on
set laststatus=2

"Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"
"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
"
"Emmet settings
let g:user__install_global = 0
autocmd FileType html,css EmmetInstall
"
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number
set noswapfile

set noerrorbells                " No beeps
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=
set backspace=indent,eol,start  " Makes backspace key more powerful.
set noswapfile                  " Don't use swapfile
set nobackup                   " Don't create annoying backup files
set splitright                  " Split vertical windows right to the current
"windows
set splitbelow                  " Split horizontal windows below to the
"current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without
"asking me anything
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

""http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus"

"new tab
nnoremap <c-t>     :tabnew<CR>

:highlight Pmenu guibg=gray gui=bold
hi Search guibg=peru guifg=wheat
highlight Search ctermfg=black
set hlsearch
set incsearch
set guioptions-=T
set guioptions-=r

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

"Beautify js, html, css with ctrl-f
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


" ==================== YouCompleteMe ====================
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

" ==================== Vim-go ====================
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>in <Plug>(go-info)
au FileType go nmap <Leader>ii <Plug>(go-implements)

au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>g  <Plug>(go-gbbuild)
au FileType go nmap <leader>t  <Plug>(go-test-compile)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>f :GoImports<CR>
"=======================================================
