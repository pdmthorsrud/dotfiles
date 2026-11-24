local colors = require("colors")
local settings = require("settings")

local apple = sbar.add("item", "apple", "left", {
  icon = { string = "\u{f179}", color = colors.iris, font = { family = settings.font, style = "Bold", size = 16.0 } },
  label = { drawing = false },
  background = { color = colors.overlay, drawing = true },
  padding_right = settings.group_paddings,
})

apple:subscribe("mouse.clicked", function()
  sbar.exec("open -a 'System Settings'")
end)
