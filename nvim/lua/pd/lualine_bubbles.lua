-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
-- Rosé Pine palette so the bubbles match the editor + tmux (names kept from the
-- fluoromachine version: purple=iris, yellow=gold, cyan=foam, red=love, orange=rose)
local colors = {
  bg      = '#191724', -- editor background (bubbles float on it)
  bgdark  = '#191724', -- text inside the bubbles
  fg      = '#908caa',
  surface = '#403d52', -- middle bubbles (= nvim selection / cursorline)
  purple  = '#c4a7e7',
  yellow  = '#f6c177',
  cyan    = '#9ccfd8',
  red     = '#eb6f92',
  orange  = '#ebbcba',
}

-- mode colours: iris normal, gold insert, foam visual, love replace, rose command
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
