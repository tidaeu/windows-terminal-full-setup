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

            vim.cmd('Dashboard')
        end,
    }
)

-- Open Dashboard through commandline if no arguments
vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
								if vim.fn.argv(0) == "" then
                    vim.cmd('Dashboard')
								end
				end,
})
