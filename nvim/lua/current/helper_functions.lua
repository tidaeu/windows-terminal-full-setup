function MergeBuffers()
    local buffers = vim.api.nvim_list_bufs()
    local cur_win = vim.api.nvim_get_current_win()

    -- Close all windows except the current one
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if win ~= cur_win then
            vim.api.nvim_win_close(win, true)
        end
    end

    -- Go through all buffers and load them into the current window
    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) then
            vim.cmd('buffer ' .. buf)
        end
    end
end
