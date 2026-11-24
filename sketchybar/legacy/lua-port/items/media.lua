local colors = require("colors")
local settings = require("settings")

-- The reference uses the `media-control` CLI; this reuses SketchyBar's media_change event
-- (same data your previous Spotify item used), limited to Spotify and Music.
local media = sbar.add("item", "media", "center", {
  icon = { string = "\u{f1bc}", color = colors.foam },
  label = { max_chars = 28, color = colors.text },
  background = { color = colors.overlay, drawing = true },
  associated_display = "active",
  drawing = false,
  updates = true,
})

media:subscribe("media_change", function(env)
  local info = env.INFO
  local ok_app = type(info) == "table" and (info.app == "Spotify" or info.app == "Music")
  if ok_app and info.state == "playing" then
    media:set({ label = tostring(info.artist) .. " – " .. tostring(info.title), drawing = true })
  else
    media:set({ drawing = false })
  end
end)

media:subscribe("mouse.clicked", function()
  sbar.exec("osascript -e 'tell application \"Spotify\" to playpause'")
end)
