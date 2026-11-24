local colors = require("colors")

-- Taller, floating bar with a translucent Rosé Pine background (as in hrtowii/dotfiles)
sbar.bar({
  height = 40,
  topmost = "window",
  corner_radius = 5,
  blur_radius = 30,
  color = 0xd9191724, -- base @ ~85%
  padding_left = 6,
  padding_right = 6,
  sticky = true,
  shadow = true,
})
