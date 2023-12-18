-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Center cursor after move
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down' })
-- Display search in the middle of screen
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search match' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search match' })
-- Move selection in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- Delete without copy
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without copy' })
vim.keymap.set({ 'n', 'v' }, '<leader>dd', '"_dd', { desc = 'Delete line without copy' })
vim.keymap.set({ 'n', 'v' }, '<leader>D', '"_D', { desc = 'Delete to the end of line without copy' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Buffers
vim.api.nvim_set_keymap('n', '<leader>tf', ':NvimTreeToggle<CR>', { silent = true, noremap = true, desc = '[T]oggle [F]ile Explorer' })
vim.keymap.set({ 'n', 'v' }, '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>bp', ':bprevious<CR>', { desc = 'Prev buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>bd', ':bdelete<CR>', { desc = 'Delete current buffer' })
vim.keymap.set('n', '<leader>bf', require('telescope.builtin').buffers, { desc = '[F]ind buffers' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim: ts=2 sts=2 sw=2 et
