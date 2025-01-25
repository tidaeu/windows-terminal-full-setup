-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
  highlight MyYankHighlight guibg=#607D8B
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="MyYankHighlight", timeout=150})
  augroup END
]]
