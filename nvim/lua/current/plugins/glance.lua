return {
  {
    'dnlhc/glance.nvim',
    cmd = 'Glance',
    config = function()
      -- Lua configuration
      local glance = require('glance')

      ---@diagnostic disable: missing-fields
      glance.setup({
        border = {
          enable = true, -- Show window borders. Only horizontal borders allowed
          top_char = '―',
          bottom_char = '―',
        },
        folds = {
          fold_closed = '📁',
          fold_open = '📂',
          -- fold_closed = '',
          -- fold_open = '',
          folded = true, -- Automatically fold list on startup
        },
      })
    end
  }
}
