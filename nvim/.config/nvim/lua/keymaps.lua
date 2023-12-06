local function map(mode, key, value)
    vim.keymap.set(mode, key, value)
end

map('n', '<C-n>', ':Neotree toggle<cr>')

map('n', '<Leader>t', ':TestFile<cr>')
map('n', '<Leader>n', ':TestNearest<cr>')

map('n', '<Leader>r', vim.lsp.buf.rename)
map('n', '<Leader>f', vim.lsp.buf.format)
map('n', 'gs', vim.lsp.buf.signature_help)
map('n', 'gh', vim.lsp.buf.hover)
map('n', 'ga', vim.lsp.buf.code_action)

local builtin = require('telescope.builtin')
map('n', '<Leader>b', function() builtin.buffers {} end)
map('n', '<C-p>', function() builtin.git_files { path_display={'smart'} } end)
map('n', '<C-f>', function() builtin.live_grep { path_display={'smart'} } end)
map('n', 'gd', function() builtin.lsp_definitions { path_display={'smart'} } end)
map('n', 'gr', function() builtin.lsp_references { path_display={'smart'}, show_line=false } end)
