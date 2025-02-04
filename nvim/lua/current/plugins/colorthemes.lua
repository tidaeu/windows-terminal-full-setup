return {
  'rebelot/kanagawa.nvim',
  lazy = true,
  config = function()
    require('kanagawa').setup {
      compile = false,             -- enable compiling the colorscheme
      undercurl = true,            -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true},
      statementStyle = { bold = true },
      typeStyle = {},
      dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
      terminalColors = true,       -- define vim.g.terminal_color_{0,17}
      colors = { theme = { all = { ui = { bg_gutter = 'none' } } } },
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
      theme = "wave",              -- Load "wave" theme when 'background' option is not set
      background = {               -- map the value of 'background' option to a theme
          dark = "wave",           -- try "dragon" !
          light = "lotus"
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = 'none' },
          FloatBorder = { bg = 'none' },
          FloatTitle = { bg = 'none' },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }
      end,
    }

    vim.cmd 'colorscheme kanagawa'
    local kanagawa = require('kanagawa.colors')
    local palette_colors = kanagawa.setup().palette

    --Set up Diagnostics
    vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = palette_colors.peachRed})
    vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = palette_colors.surimiOrange})
    vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = palette_colors.crystalBlue})
    vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = palette_colors.springGreen})

    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = '▊',
                [vim.diagnostic.severity.WARN] = '▊',
            },
        },
    })
  end,
}
