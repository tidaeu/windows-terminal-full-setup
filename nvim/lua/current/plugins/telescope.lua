return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

      require('telescope').setup({
          defaults = {
              mappings = {
                  i = {
                      ['<PageUp>'] = require('telescope.actions').preview_scrolling_up,
                      ['<PageDown>'] = require('telescope.actions').preview_scrolling_down,
                      ['<C-s>v'] = require('telescope.actions').select_vertical,
                      ['<C-s>h'] = require('telescope.actions').select_horizontal,
                  },
                  n = {
                      ['<PageUp>'] = require('telescope.actions').preview_scrolling_up,
                      ['<PageDown>'] = require('telescope.actions').preview_scrolling_down,
                      ['<C-s>v'] = require('telescope.actions').select_vertical,
                      ['<C-s>h'] = require('telescope.actions').select_horizontal,
                  },
              },
          },
      })
    end
 }
}

