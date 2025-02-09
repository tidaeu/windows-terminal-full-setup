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
	hidden = false,
	cursorline = true,
	wrap = false,
	showmode = false,
  ruler = false,
  laststatus = 2,
  cmdheight = 1,
  signcolumn = 'yes',
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
