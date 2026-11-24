local colors = require("colors")
local settings = require("settings")

local cal = sbar.add("item", "calendar", "right", {
  update_freq = 30,
  icon = { string = "\u{f0e17}", color = colors.gold },
  label = { color = colors.gold, align = "right" },
  background = { color = colors.overlay, drawing = true },
  padding_left = settings.group_paddings,
})

cal:subscribe({ "forced", "routine", "system_woke" }, function()
  cal:set({ label = os.date("%a %d. %b  %H:%M") })
end)
