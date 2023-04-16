local function map(mode, key, value)
    vim.keymap.set(mode, key, value)
end

map('n', '<C-p>', ':Telescope git_files<cr>')
map('n', '<C-f>', ':Telescope live_grep<cr>')
map('n', '<C-n>', ':Neotree toggle<cr>')

map('n', '<Leader>t', ':TestFile<cr>')
map('n', '<Leader>n', ':TestNearest<cr>')

map('n', '<Leader>r', function() vim.lsp.buf.rename() end)
map('n', '<Leader>h', function() vim.lsp.buf.signature_help() end)
