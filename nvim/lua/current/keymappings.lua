vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<Leader>mw', ':lua MergeBuffers()<CR>', { noremap = true, silent = true })
