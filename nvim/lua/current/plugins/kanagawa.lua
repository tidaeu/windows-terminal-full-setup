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
        local palette = colors.palette
        return {
          GitSignsAdd = { fg = palette.carpYellow },
          GitSignsChange = { fg = palette.carpYellow },
          GitSignsStagedAdd = { fg = palette.carpYellow },
          GitSignsStagedChange = { fg = palette.carpYellow },

          DiagnosticUnderlineError = { undercurl = true, sp = palette.peachRed },
          DiagnosticSignError = { fg = palette.peachRed },
          DiagnosticSignWarn = { fg = palette.crystalBlue },
          DiagnosticSignInfo = { fg = palette.lightBlue },
          DiagnosticsSignHint = { fg = palette.crystalBlue },

          NormalFloat = { bg = 'none' },
          FloatBorder = { bg = 'none' },
          FloatTitle = { bg = 'none' },

          GlanceWinBarFilename= { fg = palette.roninYellow }, -- Top bar and File Names
          GlanceWinBarTitle = { fg = palette.oniViolet }, -- Top bar and File Names
          GlanceWinBarFilepath = { fg = palette.oniViolet }, -- Top bar and File Names
          -- GlancePreviewNormal = {bg = "#252535" }, -- Background Preview 
          -- GlanceListNormal = {bg = "#252535" }, -- Background Preview 
          GlancePreviewNormal = {bg = palette.sumiInk2 }, -- Background Preview 
          GlanceListNormal = {bg = palette.sumiInk2 }, -- Background Preview 
          -- GlanceBorderTop = {bg = "#2D4F67"}, -- Top bar and File Names
          GlanceBorderTop = {bg = "none"}, -- Top bar and File Names
          -- GlanceBorderBottom = {bg = "#2D4F67" }, -- Top bar and File Names
          -- GlancePreviewBorderBottom = {bg = "none" }, -- Top bar and File Names
          -- GlanceListBorderBottom = {bg = "none" }, -- Top bar and File Names
          -- GlanceIndent = {bg = "#252535" }, -- Top bar and File Names
          -- GlancePreviewLineNr = {bg = "#252535" }, -- Top bar and File Names
          -- GlancePreviewSignColumn = {bg = "#252535" }, -- Top bar and File Names
          -- GlancePreviewEndOfBuffer = {bg = "#252535" }, -- Top bar and File Names
          -- GlanceListCursorLine  = {bg = "#363646" }, -- Top bar and File Names
          GlanceFolderIcon = { bg = "#000000" },

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

    vim.cmd.colorscheme "kanagawa-wave"
  end,
}
