local builtin = require('telescope.builtin')
local neogit = require('neogit')

local function map(mode, key, value)
    vim.keymap.set(mode, key, value, { noremap = true })
end

map('n', '<C-n>', ':Neotree toggle<cr>')

map('n', '<Leader>t', ':TestFile<cr>')
map('n', '<Leader>tn', ':TestNearest<cr>')

map('n', '<Leader>r', vim.lsp.buf.rename)
map('n', '<Leader>f', vim.lsp.buf.format)
map('n', 'gs', vim.lsp.buf.signature_help)
map('n', 'gh', vim.lsp.buf.hover)
map('n', 'ga', vim.lsp.buf.code_action)
map('n', 'gg', neogit.open)

map('n', '<Leader>b', builtin.buffers)
map('n', '<C-p>', function() builtin.git_files { path_display={'truncate'} } end)
map('n', '<C-f>', function() builtin.live_grep { path_display={'truncate'} } end)
map('n', 'gd', function() builtin.lsp_definitions { path_display={'truncate'} } end)
map('n', 'gr', function() builtin.lsp_references { path_display={'truncate'}, show_line=false } end)

