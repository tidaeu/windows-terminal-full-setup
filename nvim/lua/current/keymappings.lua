-- Basics
vim.g.mapleader = ' '
vim.keymap.set("n", "<localleader>", '<cmd>lua require("which-key").show("\\\\")<cr>')

-- Back and Forth Navigation
vim.api.nvim_set_keymap('n', '<A-i>', '<C-o>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-o>', '<C-i>', { noremap = true, silent = true })

-- Split Navigation
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, silent = true })

-- Random
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<Tab>', '<cmd>bn<CR>')
vim.keymap.set('n', '<S-Tab>', '<cmd>bp<CR>')
vim.keymap.set('n', '<leader>s', '<cmd>vsp #2<CR>')
vim.keymap.set('n', '<leader>s', ':lua FindHiddenBufferOrCreateNew()<CR>')
vim.keymap.set('n', '<Leader>mw', ':lua MergeBuffers()<CR>', { noremap = true, silent = true })
