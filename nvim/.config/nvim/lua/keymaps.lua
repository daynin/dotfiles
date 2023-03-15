local function map(mode, key, value)
    vim.keymap.set(mode, key, value)
end

map('n', '<Leader>s', ':%s/<C-r><C-w>/')

map('n', '<C-p>', ':Telescope find_files<cr>')
map('n', '<C-n>', ':NvimTreeToggle<cr>')

map('n', '<Leader>t', ':TestFile<cr>')
map('n', '<Leader>n', ':TestNearest<cr>')

map('n', '<Leader>j', ':AnyJump')
map('v', '<Leader>j', ':AnyJumpVisual')
map('n', '<Leader>jb', ':AnyJumpBack')
map('n', '<Leader>jl', ':AnyJumpLastResults')

