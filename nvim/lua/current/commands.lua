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
-- vim.api.nvim_create_autocmd(
--     'BufWinLeave',
--     {
--         callback = function ()
--           local buffers = vim.fn.execute("ls")
--           local count = 0
--           -- Match only lines that represent buffers, typically starting with a number followed by a space
--           for line in string.gmatch(buffers, "[^\r\n]+") do
--             if string.match(line, "^%s*%d+") and not string.match(line, "No Name") then
--                 count = count + 1
--             end
--           end

          -- if count == 0 then

            -- print("Count is 0")
              -- vim.cmd('Oil --float')
          -- end
--         end,
--     }
-- )

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
