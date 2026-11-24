local colors = require("colors")
local settings = require("settings")

local front_app = sbar.add("item", "front_app", "left", {
  icon = { drawing = false },
  label = {
    color = colors.text,
    font = { family = settings.font, style = "Bold", size = 13.0 },
  },
  background = { color = colors.overlay, drawing = true },
  associated_display = "active",
  padding_left = settings.group_paddings,
})

front_app:subscribe("front_app_switched", function(env)
  front_app:set({ label = env.INFO })
end)
