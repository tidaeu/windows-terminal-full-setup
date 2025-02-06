-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
  highlight MyYankHighlight guibg=#607D8B
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="MyYankHighlight", timeout=150})
  augroup END
]]

-- Open Dashboard through commandline if no arguments
vim.api.nvim_create_autocmd("VimEnter", {
	callback = vim.schedule_wrap(function(data)
		if data.file == "" or vim.fn.isdirectory(data.file) ~= 0 then
       vim.cmd('Oil --float')
		end
	end),
})

-- Clear command line immediately after execution
vim.api.nvim_create_autocmd('CmdlineLeave', {
  pattern = '*',
  callback = function()
    -- vim.cmd('echom ""')
    -- Test
  end,
})

-- Function to close Oil
local function close_oil()
  for _, buf in ipairs(vim.fn.getbufinfo({bufloaded = true})) do
    if string.match(vim.fn.bufname(buf.bufnr), "oil://") then
      vim.cmd("bd " .. buf.bufnr)
    end
  end
end

-- Autocmd to run the function when Telescope opens
vim.api.nvim_create_autocmd('User', {
  pattern = 'TelescopePreviewerLoaded',
  callback = close_oil,
})
