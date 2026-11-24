local colors = require("colors")
local settings = require("settings")

local wifi = sbar.add("item", "widgets.wifi", "right", {
  update_freq = 30,
  icon = { string = "\u{f1eb}", color = colors.foam },
  label = { color = colors.foam, max_chars = 14 },
  background = { color = colors.overlay, drawing = true },
  padding_left = settings.group_paddings,
})

-- The reference uses a compiled network_load event provider; this polls instead.
-- SSID may be redacted on recent macOS, in which case only the icon dims.
wifi:subscribe({ "routine", "system_woke", "forced", "wifi_change" }, function()
  sbar.exec("ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}'", function(out)
    local ssid = tostring(out or ""):gsub("%s+$", "")
    if ssid == "" or ssid:find("redacted") then
      wifi:set({ icon = { color = colors.muted }, label = "" })
    else
      wifi:set({ icon = { color = colors.foam }, label = ssid })
    end
  end)
end)
