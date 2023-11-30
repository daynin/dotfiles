local function map(mode, key, value)
    vim.keymap.set(mode, key, value)
end

map('n', '<C-p>', ':Telescope git_files<cr>')
map('n', '<C-f>', ':Telescope live_grep<cr>')
map('n', '<C-n>', ':Neotree toggle<cr>')


map('n', '<Leader>t', ':TestFile<cr>')
map('n', '<Leader>n', ':TestNearest<cr>')

map('n', '<Leader>r', vim.lsp.buf.rename)
map('n', '<Leader>f', vim.lsp.buf.format)
map('n', 'gs', vim.lsp.buf.signature_help)
map('n', 'gh', vim.lsp.buf.hover)
map('n', 'ga', vim.lsp.buf.code_action)
