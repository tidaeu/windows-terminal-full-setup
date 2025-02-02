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
	cursorline = true,
  wrap = false
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '🔴',
            [vim.diagnostic.severity.WARN] = '🔵',
        },
    },
})
