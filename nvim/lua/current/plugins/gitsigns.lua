return {
   {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup({
        sign_priority = 0,
        signs = {
          add          = { text = '┇' },
          change       = { text = '┇' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┇' },
        },
      })
    end
  }
}
