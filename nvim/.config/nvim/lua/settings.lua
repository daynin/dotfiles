local g = vim.g
local o = vim.o

-- Performance optimizations
o.lazyredraw = true
o.updatetime = 250
o.timeoutlen = 300
o.ttimeoutlen = 10

-- UI optimizations
vim.opt.listchars = { nbsp = '␣', trail = '·', tab = '| |' }
vim.opt.list = true
vim.opt.foldenable = false
o.cursorline = false -- Disable for performance
o.relativenumber = false -- Disable for performance

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

-- File handling optimizations
o.swapfile = false
o.backup = false
o.writebackup = false
o.undofile = true
o.undodir = vim.fn.stdpath('data') .. '/undo'

o.splitright = true
o.splitbelow = true
o.fileformats = 'unix,dos,mac'
o.backspace = 'indent,eol,start'

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.showmatch = true

-- Disable some built-in plugins for performance
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
