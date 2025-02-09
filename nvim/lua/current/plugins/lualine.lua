return {
  "nvim-lualine/lualine.nvim",
  dependencies = {'rebelot/kanagawa.nvim'},
  config = function()
    local kanagawa = require('kanagawa.colors')
    local palette_colors = kanagawa.setup().palette
    local transparentbg = nil

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return  gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local config = {
      options = {
        component_separators = "",
        section_separators = "",
        always_show_tabline = false,
        globalstatus = false,
        theme = {
          normal = { c = { fg = palette_colors.sumiInk0 or "#ffffff", bg = transparentbg } },
          inactive = { c = { fg = palette_colors.crystalBlue or "#ffffff", bg = transparentbg} },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
        },
      tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
        },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      height = 4
    }

    local mode_map = {
      ['NORMAL'] = 'N',
      ['O-PENDING'] = 'N?',
      ['INSERT'] = 'I',
      ['VISUAL'] = 'V',
      ['V-BLOCK'] = 'VB',
      ['V-LINE'] = 'VL',
      ['V-REPLACE'] = 'VR',
      ['REPLACE'] = 'R',
      ['COMMAND'] = '!',
      ['SHELL'] = 'SH',
      ['TERMINAL'] = 'T',
      ['EX'] = 'X',
      ['S-BLOCK'] = 'SB',
      ['S-LINE'] = 'SL',
      ['SELECT'] = 'S',
      ['CONFIRM'] = 'Y?',
      ['MORE'] = 'M',
    }

    local mode_color = {
      n = palette_colors.oldWhite,
      i = palette_colors.roninYellow,
      v = palette_colors.crystalBlue,
      [''] = palette_colors.oldWhite,
      V = palette_colors.springBlue,
    }

    local component_config = {
      outer_padding = 1,
      inner_padding = 0,
      inactive_color = { fg = palette_colors.fujiGray }
    }

    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function ins_left_inactive(component)
      table.insert(config.inactive_sections.lualine_c, component)
    end

    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    local function ins_right_inactive(component)
      table.insert(config.inactive_sections.lualine_x, component)
    end

    -- left item active
    ins_left {
      function()
        return '▊'
      end,
      color = function()
        return { fg = mode_color[vim.fn.mode()] or palette_colors.sakuraPink }
      end,
      padding = { left = component_config.outer_padding, right = component_config.inner_padding },
    }

    ins_left {
      'mode',
      fmt = function(s) return mode_map[s] or s end,
      gui='bold',
      color = function()
        return { fg = mode_color[vim.fn.mode()] or palette_colors.sakuraPink,}
      end,
    }

    ins_left {
      'branch',
      cond = conditions.check_git_workspace,
      icon = '',
      color = { fg = palette_colors.sakuraPink, gui='bold'},
    }

    ins_left {
      'filename',
      cond = conditions.buffer_not_empty,
      color = { fg = palette_colors.waveRed, gui = 'bold' },
    }

    -- left item inactive
    -- local inactiveColor = { fg = palette_colors.fujiGray }

    ins_left_inactive {
      function()
        return '▊'
      end,
      color = component_config.inactive_color,
      padding = { left = component_config.outer_padding, right = component_config.inner_padding },
    }

    ins_left_inactive {
      'mode',
      fmt = function(s) return mode_map[s] or s end,
      gui='bold',
      color = component_config.inactive_color,
    }

    ins_left_inactive {
      'branch',
      cond = conditions.check_git_workspace,
      icon = '',
      color = component_config.inactive_color,
    }

    ins_left_inactive {
      'filename',
      cond = conditions.buffer_not_empty,
      color = component_config.inactive_color,
    }

    -- right items

    ins_right {
      'fileformat',
      fmt = string.upper,
      icons_enabled = true,
      color = { fg = palette_colors.oldWhite, gui = 'bold' },
    }

    ins_right {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      always_visible = true,
      sections = {'error', 'warn', 'hint'},
      symbols = {  error = '', warn = '', info = '', hint='' },
      diagnostics_color = {
        error = { fg = palette_colors.sakuraPink},
        warn = { fg = palette_colors.roninYellow},
        info = { fg = palette_colors.waveBlue2},
        hint= { fg = palette_colors.springViolet2},
      },
    }

    ins_right {
      function()
        return '▊'
      end,
      color = { fg = mode_color[vim.fn.mode()] },
      padding = { left = component_config.inner_padding, right = component_config.outer_padding },
    }

    ins_right_inactive {
      'fileformat',
      fmt = string.upper,
      icons_enabled = true,
      color = component_config.inactive_color,
    }

    ins_right_inactive {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      always_visible = true,
      sections = {'error', 'warn', 'hint'},
      symbols = {  error = '', warn = '', info = '', hint='' },
      diagnostics_color = {
        error = component_config.inactive_color,
        warn = component_config.inactive_color,
        info = component_config.inactive_color,
        hint= component_config.inactive_color,
      },
    }

    ins_right_inactive {
      function()
        return '▊'
      end,
      color = component_config.inactive_color,
      padding = { left = component_config.inner_padding, right = component_config.outer_padding },
    }

    require('lualine').setup(config)
  end
}
