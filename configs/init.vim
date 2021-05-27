call plug#begin('~/.vim/plugged')
"common
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'thinca/vim-quickrun'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'pechorin/any-jump.vim'
Plug 'mhinz/vim-startify'
Plug 'vimwiki/vimwiki'
Plug 'janko/vim-test'
"HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'othree/html5.vim', { 'for': ['html', 'javascript'] }
Plug 'tpope/vim-haml', { 'for': 'haml'}
"CSS/SCSS
Plug 'norcalli/nvim-colorizer.lua'
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
"JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
"Go lang
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'nsf/gocode',  { 'for': 'go' }
"TypeScript
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
"Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
"C / C++
Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp'] }
Plug 'justmao945/vim-clang'
"Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
"Elm
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
"Themes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'hardcoreplayers/oceanic-material'
Plug 'reedes/vim-colors-pencil'
"TOML
Plug 'cespare/vim-toml', { 'for': 'toml' }
"Nim
Plug 'alaviss/nim.nvim', { 'for': 'nim' }
"Elixir
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
" Markdown
Plug 'reedes/vim-lexical', { 'for': [ 'markdown', 'vimwiki' ] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': [ 'markdown', 'vimwiki' ] }
" Graphviz
Plug 'liuchengxu/graphviz.vim', { 'for': 'dot' }
" SMT2
Plug 'bohlender/vim-smt2', { 'for': 'smt2' }
" R
Plug 'jalvesaq/Nvim-R', { 'branch': 'stable', 'for': 'r' }
" Racket
Plug 'wlangstroth/vim-racket', { 'for': [ 'racket', 'scheme' ] }
Plug 'Olical/conjure', { 'tag': 'v4.19.0', 'for': [ 'racket', 'clojure' ] }
call plug#end()

" Settings
set autoread
syntax enable
set t_Co=256
set spelllang=en,ru

set tabstop=2
set shiftwidth=4
set expandtab
set autoindent
set number
set termguicolors
set nocursorline
set nocursorcolumn
set encoding=UTF-8
syntax sync minlines=256

set background=dark
colorscheme gruvbox

" Autocompletion in vim command line
set wildmode=longest,list,full

set wildmenu      " enhanced command line completion
set hidden        " current buffer can be put into background
set cmdheight=1   " command bar height

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

set nocompatible " not compatible with vi

" make backspace behave in a sane manner
set backspace=indent,eol,start
"find a word

" set a map leader for more key combos
let g:mapleader = ','
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <C-f> :Ag -Q "
nnoremap <Leader>gt :FlowJumpToDef<CR>
nnoremap <Leader><Space> :VimwikiToggleListItem<CR>

" Fuzzy search
map <C-p> :Telescope find_files<CR>

" File manager
nnoremap <C-n> :NERDTreeToggle<CR>

" CoC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Vim-test
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>n :TestNearest<CR>

hi UltestPass ctermfg=Green guifg=#b8ba25
hi UltestFail ctermfg=Red guifg=#fb4833
hi UltestRunning ctermfg=Yellow guifg=#fabc2e


set noerrorbells                " No beeps
set novisualbell
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
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

"set timeout
set timeoutlen=1000
"set ttimeout
set ttimeoutlen=50

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

"VimWiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

"Any Jump
 " Normal mode: Jump to definition under cursore
nnoremap <leader>j :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader>j :AnyJumpVisual<CR>

" Normal mode: open previous opened file (after jump)
nnoremap <leader>jb :AnyJumpBack<CR>

" Normal mode: open last closed search window again
nnoremap <leader>jl :AnyJumpLastResults<CR>

" vim-lexical
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd,vimwiki call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

augroup pandoc_syntax
  autocmd! FileType vimwiki set syntax=markdown.pandoc
augroup END

" Conjure
nnoremap <silent> <Leader>ee :ConjureEvalCurrentForm<CR>
nnoremap <silent> <Leader>er :ConjureEvalRootForm<CR>

" Treesitter

lua <<EOF
require'colorizer'.setup()

require'nvim-treesitter.configs'.setup{
    ensure_installed = "maintained",
}

require'lualine'.setup {
    options = {
        theme = 'jellybeans',
        component_separators = {'', ''},
        section_separators = {'', ''},
        disabled_filetypes = {}
    },
}
EOF
