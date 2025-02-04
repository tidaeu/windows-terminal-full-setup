  -- Winbar
  -- Require the colors.lua module and access the colors directly without
  -- additional file reads
  -- local colors = require("config.colors")
  vim.cmd(string.format([[highlight WinBar1 guifg=%s]], "#FFFFFF"))
  vim.cmd(string.format([[highlight WinBar2 guifg=%s]], "#FFFFFF"))
  vim.cmd(string.format([[highlight WinBar3 guifg=%s gui=bold]], "#FFFFFF"))
  -- Function to get the full path and replace the home directory with ~
  local function get_winbar_path()
    local full_path = vim.fn.expand("%:p:h")
    return full_path:gsub(vim.fn.expand("$HOME"), "🏠")
  end
  -- Function to get the number of open buffers using the :ls command
  local function get_buffer_count()
    local buffers = vim.fn.execute("ls")
    local count = 0
    -- Match only lines that represent buffers, typically starting with a number followed by a space
    for line in string.gmatch(buffers, "[^\r\n]+") do
      if string.match(line, "^%s*%d+") then
        count = count + 1
      end
    end
    return count
  end
  -- Function to update the winbar
  local function update_winbar()
    local buffer_count = get_buffer_count()
    local home_replaced = get_winbar_path()
    vim.opt.winbar = "%#WinBar2#("
    .. buffer_count
    .. ") "
    .. "%#WinBar1#"
    .. home_replaced
    -- .. "%#WinBar3#"
    -- .. vim.fn.expand("%:t")
  end

  -- Autocmd to update the winbar on BufEnter and WinEnter events
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
    callback = function()
        local bufs = vim.fn.getbufinfo({ buflisted = 1 })
        if #bufs == 1 and vim.bo.filetype ~= "oil" then
            update_winbar()
        end
    end,
})
