local colors = require("colors")
local settings = require("settings")

local p = settings.paddings

sbar.default({
  updates = "when_shown",
  scroll_texts = true,
  padding_left = 5,
  padding_right = 5,
  icon = {
    font = { family = settings.font, style = "Bold", size = 14.0 },
    color = colors.text,
    padding_left = p,
    padding_right = p,
  },
  label = {
    font = { family = settings.font, style = "Medium", size = 13.0 },
    color = colors.text,
    padding_left = p,
    padding_right = p,
  },
  background = {
    height = 28,
    corner_radius = settings.corner_radius,
    border_width = 1,
    border_color = colors.overlay,
  },
  popup = {
    background = {
      border_width = 2,
      corner_radius = settings.corner_radius,
      border_color = colors.muted,
      color = colors.overlay,
      shadow = { drawing = true },
    },
    blur_radius = 30,
  },
})
