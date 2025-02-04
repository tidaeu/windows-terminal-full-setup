-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
  highlight MyYankHighlight guibg=#607D8B
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="MyYankHighlight", timeout=150})
  augroup END
]]

-- Dashboard Specific
-- open Dashboard if last buffer
vim.api.nvim_create_autocmd(
    'BufDelete',
    {
        callback = function (event)
            for buf = 1, vim.fn.bufnr('$') do
                if buf ~= event.buf and vim.fn.buflisted(buf) == 1 then
                    if vim.api.nvim_buf_get_name(buf) ~= '' and vim.bo[buf].filetype ~= 'dashboard' then
                        return
                    end
                end
            end

            -- vim.cmd('Oil --float')
        end,
    }
)

-- Open Dashboard through commandline if no arguments
vim.api.nvim_create_autocmd("VimEnter", {
	callback = vim.schedule_wrap(function(data)
		vim.print(vim.fn.isdirectory(data.file))
		if data.file == "" or vim.fn.isdirectory(data.file) ~= 0 then
       vim.print(data.file)
       vim.cmd('Oil --float')
		end
	end),
})

-- Clear command line immediately after execution
vim.api.nvim_create_autocmd('CmdlineLeave', {
  pattern = '*',
  callback = function()
    vim.cmd('echom ""')
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
