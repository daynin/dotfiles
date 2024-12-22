local g = vim.g
local o = vim.o

vim.opt.listchars = { nbsp = '␣', trail = '·', tab = '| |' }
vim.opt.list = true
vim.opt.foldenable = false

g.mapleader = ','
o.exrc = true
o.autoread = true
o.spelllang = 'ru,en'
o.tabstop = 2
o.shiftwidth = 2
o.number = true
o.expandtab = true
o.autoindent = true
o.termguicolors = true
o.clipboard = 'unnamedplus'
o.background = 'dark'

o.wildmode = 'longest,list,full'
o.wildmenu = true
o.hidden = true
o.cmdheight = 1
o.langmap =
'ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;\'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>'

o.swapfile = false
o.splitright = true
o.splitbelow = true
o.fileformats = 'unix,dos,mac'
o.backspace = 'indent,eol,start'

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.showmatch = true
o.timeoutlen = 200
