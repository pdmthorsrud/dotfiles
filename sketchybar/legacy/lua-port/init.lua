-- Require the sketchybar module
sbar = require("sketchybar")

-- Batch all config changes into one update
sbar.begin_config()
require("bar")
require("default")
require("items")
sbar.end_config()

-- Run the event loop (keeps the Lua process alive)
sbar.event_loop()
