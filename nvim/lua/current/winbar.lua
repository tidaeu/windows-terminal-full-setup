  -- Winbar
  -- Require the colors.lua module and access the colors directly without
  -- additional file reads
  -- local colors = require("config.colors")
  local kanagawa = require('kanagawa.colors')
  local palette_colors = kanagawa.setup().palette

  vim.cmd(string.format([[highlight WinBar1 guifg=%s]], palette_colors.roninYellow))
  vim.cmd(string.format([[highlight WinBar2 guifg=%s]], palette_colors.oniViolet))
  vim.cmd(string.format([[highlight WinBar3 guifg=%s gui=bold]], palette_colors.surimiOrange))

  -- Function to get the full path and replace the home directory with ~
  -- local function get_winbar_path()
  --   local full_path = vim.fn.expand("%:p")
  --   -- return full_path:gsub(vim.fn.expand("$HOME"), "🏠")
  --   return full_path:gsub(vim.fn.expand("$HOME"), " ")
  -- end

  -- Function to update the winbar
  local function update_winbar()
    local buffer_count = getBufferCount()
    if buffer_count > 0 then
      vim.opt.winbar = "%#WinBar1#("
      .. buffer_count
      .. ") "
      .. "%#WinBar2#"
      .. "  %f"
      -- .. "%#WinBar3#"
      -- .. vim.fn.expand("%:t")
    else
      vim.opt.winbar = ""
    end
  end
  --
-- Autocmd to update the winbar on BufEnter and WinEnter events
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
    callback = function()
        update_winbar()
    end,
})
