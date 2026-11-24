local colors = require("colors")
local settings = require("settings")

local battery = sbar.add("item", "widgets.battery", "right", {
  update_freq = 180,
  icon = { color = colors.rose },
  label = { color = colors.rose },
  background = { color = colors.overlay, drawing = true },
  padding_left = settings.group_paddings,
})

local function icon_for(pct, charging)
  if charging then return "\u{f0e7}" end
  if pct >= 90 then return "\u{f240}" end
  if pct >= 60 then return "\u{f241}" end
  if pct >= 30 then return "\u{f242}" end
  if pct >= 10 then return "\u{f243}" end
  return "\u{f244}"
end

battery:subscribe({ "routine", "power_source_change", "system_woke", "forced" }, function()
  sbar.exec("pmset -g batt", function(out)
    local pct = tonumber(tostring(out):match("(%d+)%%"))
    if not pct then return end
    local charging = tostring(out):find("AC Power") ~= nil
    local color = pct <= 15 and not charging and colors.love or colors.rose
    battery:set({
      icon = { string = icon_for(pct, charging), color = color },
      label = { string = pct .. "%", color = color },
    })
  end)
end)
