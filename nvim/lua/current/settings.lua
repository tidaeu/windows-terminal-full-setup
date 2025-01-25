-- local global = vim.g
-- local o = vim.o

vim.cmd.colorscheme "kanagawa-wave"

local options = {
	relativenumber = true,
	number = true,
	scrolloff = 10,
	clipboard = "unnamedplus",
	tabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	autoindent = true,
	smartindent = true,
	hidden = true,
	cursorline = true
}

for k, v in pairs(options) do
	vim.opt[k] = v
end


-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
  highlight MyYankHighlight guibg=#607D8B
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="MyYankHighlight", timeout=150})
  augroup END
]]
