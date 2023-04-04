local g = vim.g
local o = vim.o

g.mapleader = ','
o.autoread = true
o.t_Co = 256
o.spelllang = 'ru,en'
o.tabstop = 2
o.shiftwidth = 2
o.number = true
o.expandtab = true
o.autoindent = true
o.termguicolors = true
o.nocursorline = true
o.nocursorcolumn = true
o.clipboard = 'unnamedplus'
o.endfunction = 'UTF-8'
o.minlines = 256
o.background = 'dark'

o.wildmode = 'longest,list,full'
o.wildmenu = true
o.hidden = true
o.cmdheight = 1
o.langmap = 'ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;\'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>'

o.nocompatible = true

o.noerrorbells = true
o.novisualbell = true
o.noswapfile = true
o.nobackup = true
o.splitright = true
o.splitbelow = true
o.fileformats = 'unix,dos,mac'
o.backspace = 'indent,eol,start'

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.showmatch = true
o.timeoutlen = 1000
o.ttimeoutlen = 50

vim.cmd.colorscheme('onedark')

