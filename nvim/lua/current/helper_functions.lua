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

function FindHiddenBufferOrCreateNew()
  -- Get all window IDs
  local windows = vim.api.nvim_list_wins()
  local buffers = vim.api.nvim_list_bufs()

  if(#windows == 1 and GetBufferCount() == 1) then
    local current_buf = vim.api.nvim_get_current_buf()
    local buf_name = vim.api.nvim_buf_get_name(current_buf)
    vim.cmd("enew")
    vim.cmd("vsplit " .. buf_name)
    return
  end

   for _, buf in ipairs(buffers) do
      if not vim.api.nvim_buf_is_loaded(buf) then
        local buf_name = vim.api.nvim_buf_get_name(buf)
        vim.cmd("vsplit " .. buf_name)
        return
      end
    end
end

function GetBufferCount()
    local buffers = vim.fn.execute("ls")
    local count = 0
    -- Match only lines that represent buffers, typically starting with a number followed by a space
    for line in string.gmatch(buffers, "[^\r\n]+") do
      if string.match(line, "^%s*%d+") and not string.match(line, "No Name") and not string.match(line, "oil://") then
          count = count + 1
      end
    end
    return count
 end

function CloseFloatingWindow()
  local win = vim.api.nvim_get_current_win()
  local config = vim.api.nvim_win_get_config(win)

  if config.relative ~= '' then
    vim.api.nvim_win_close(win, true)
  end
end

function ShowDiagnosticsOrDescription()
  local bufnr = vim.api.nvim_get_current_buf()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })

  if #diagnostics > 0 then
    vim.diagnostic.open_float()
  else
    vim.lsp.buf.hover()
  end
end

function GoToPrevError()
  local opts = {
    severity = vim.diagnostic.severity.ERROR,
  }
  vim.diagnostic.goto_prev(opts)
end

function GoToNextError()
  local opts = {
    severity = vim.diagnostic.severity.ERROR,
  }
  vim.diagnostic.goto_next(opts)
end
