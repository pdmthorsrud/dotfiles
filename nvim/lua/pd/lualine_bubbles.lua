-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
-- Fluoromachine palette (maxmx03/fluoromachine.nvim) so the bubbles match the editor + tmux
local colors = {
  bg      = '#262335', -- editor background (bubbles float on it)
  bgdark  = '#241B2F', -- text inside the bubbles
  fg      = '#8BA7A7',
  surface = '#463465', -- middle bubbles (= nvim selection / cursorline)
  purple  = '#AF6DF9',
  yellow  = '#FFCC00',
  cyan    = '#61E2FF',
  red     = '#FE4450',
  orange  = '#FF8B39',
}

-- mode colours follow fluoromachine's own lualine theme
local bubbles_theme = {
  normal = {
    a = { fg = colors.bgdark, bg = colors.purple, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.surface },
    c = { fg = colors.fg, bg = colors.bg },
  },

  insert  = { a = { fg = colors.bgdark, bg = colors.yellow, gui = 'bold' } },
  visual  = { a = { fg = colors.bgdark, bg = colors.cyan,   gui = 'bold' } },
  replace = { a = { fg = colors.bgdark, bg = colors.red,    gui = 'bold' } },
  command = { a = { fg = colors.bgdark, bg = colors.orange, gui = 'bold' } },

  inactive = {
    a = { fg = colors.fg, bg = colors.bg },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
