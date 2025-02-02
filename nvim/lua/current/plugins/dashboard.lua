return {
  {
    'nvimdev/dashboard-nvim',
    dependencies = { {'nvim-tree/nvim-web-devicons'}},
    event = 'VimEnter',
    config = function()
      require('dashboard').setup({
              theme = 'hyper',
              hide = {
                      statusline = false    -- hide statusline default is true	
              },
              shortcut_type = 'number',
              config = {
                      week_header = {
                              enable = true,
                      },
                      header = banner,
                      project = { enable = false, limit = 8,  action = 'Telescope projects=' },
                      mru = { limit = 8},
                      footer = { "","","🙉🚀 Try not to suck today 🚀🙉" },
                      shortcut = {
                              {
                                      icon = ' ',
                                      icon_hl = '@variable',
                                      desc = 'Find Files',
                                      group = 'Label',
                                      action = 'Telescope find_files',
                                      key = '<leader>ff',
                              },
                              -- {
                              --         desc = '🌲Toggle Tree',
                              --         group = 'DiagnosticHint',
                              --         action = 'Neotree toggle',
                              --         key = '<C-t>',
                              -- },
                              {
                                      desc = '  Quit',
                                      group = 'Number',
                                      action = 'q',
                                      key = 'q',
                              },
                              -- {
                              --   desc = ' dotfiles',
                              --   group = 'Number',
                              --   action = 'os.execute(C:\\Users\\tdeuk\\AppData\\Local\\nvim\\lua\\user\\nvim-tree.lua)',
                              --   key = 'd',
                              -- },
                      },
              },
      })
    end,
  }
}
