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
  termguicolors = true
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.diagnostic.config {
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '⮿',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = "󰋼",
      [vim.diagnostic.severity.HINT] = "󰌵",
      -- [vim.diagnostic.severity.INFO] = "󰋼",
      -- [vim.diagnostic.severity.ERROR] = "",
      -- [vim.diagnostic.severity.WARN] = "",
      -- [vim.diagnostic.severity.INFO] = "󰋼",
      -- [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
  float = {
    border = "rounded",
    format = function(d)
      return ("%s (%s) [%s]"):format(d.message, d.source, d.code or d.user_data.lsp.code)
    end,
  },
  underline = true,
  jump = {
    float = true,
  },
}
