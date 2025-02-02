return {
  {
    'stevearc/oil.nvim',
     -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      require('oil').setup{
        float = {
        -- Padding around the floating window
        padding = 0,
        -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        max_width = 70,
        max_height = 20,
        border = "rounded",
        win_options = {
          winblend = 0,
          }
        }
      }

      vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

    end
  }
}
