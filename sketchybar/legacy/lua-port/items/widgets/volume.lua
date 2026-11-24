local colors = require("colors")
local settings = require("settings")

local volume = sbar.add("item", "widgets.volume", "right", {
  icon = { color = colors.pine },
  label = { color = colors.pine },
  background = { color = colors.overlay, drawing = true },
  padding_left = settings.group_paddings,
})

local function icon_for(v)
  if v == 0 then return "\u{f026}" end
  if v < 50 then return "\u{f027}" end
  return "\u{f028}"
end

volume:subscribe("volume_change", function(env)
  local v = tonumber(env.INFO) or 0
  volume:set({ icon = icon_for(v), label = v .. "%" })
end)

-- Scroll over the item to change the volume
volume:subscribe("mouse.scrolled", function(env)
  local delta = tonumber(env.SCROLL_DELTA) or 0
  sbar.exec("osascript -e 'set volume output volume (output volume of (get volume settings) + " .. delta .. ")'")
end)

-- Initial value
sbar.exec("osascript -e 'output volume of (get volume settings)'", function(out)
  local v = tonumber(out) or 0
  volume:set({ icon = icon_for(v), label = v .. "%" })
end)
