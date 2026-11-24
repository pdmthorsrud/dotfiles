local colors = require("colors")
local settings = require("settings")

sbar.add("event", "aerospace_workspace_change")
sbar.add("event", "aerospace_window_change")

-- Nerd Font glyphs for common apps; anything else gets a generic window icon.
-- (The reference uses sketchybar-app-font via helpers/app_icons.lua.)
local app_icons = {
  ["Firefox"] = "\u{f269}",
  ["Zen"] = "\u{f0ac}",
  ["Dia"] = "\u{f0ac}",
  ["Safari"] = "\u{f267}",
  ["Microsoft Edge"] = "\u{f0ac}",
  ["iTerm2"] = "\u{f120}",
  ["Terminal"] = "\u{f120}",
  ["Code"] = "\u{e70c}",
  ["Visual Studio Code"] = "\u{e70c}",
  ["Slack"] = "\u{f198}",
  ["Spotify"] = "\u{f1bc}",
  ["Notion"] = "\u{f24a}", -- fa-sticky-note-o (no Notion logo in Nerd Fonts)
  ["Claude"] = "\u{f069}", -- fa-asterisk, closest to Claude's starburst logo
  ["Microsoft Outlook"] = "\u{f0d22}", -- nf-md-microsoft_outlook
}
local default_icon = "\u{f2d0}"

-- Same scheme as the reference: item has a plain fill + thin border, a transparent
-- bracket around it carries the thick border, and focus recolours the borders.
local items, brackets = {}, {}
for sid = 1, settings.workspaces do
  local name = "space." .. sid
  items[sid] = sbar.add("item", name, "left", {
    icon = {
      string = tostring(sid),
      color = colors.text,
      highlight_color = colors.iris,
      padding_left = 8,
      padding_right = 3,
      y_offset = 1,
    },
    label = {
      string = "—",
      font = { family = settings.font, style = "Regular", size = 14.0 },
      color = colors.muted,
      highlight_color = colors.text,
      padding_left = 4,
      padding_right = 10,
    },
    background = {
      color = colors.surface,
      border_width = 1,
      border_color = colors.base,
      height = 26,
    },
    padding_left = 1,
    padding_right = 1,
  })

  brackets[sid] = sbar.add("bracket", { name }, {
    background = {
      color = colors.transparent,
      border_color = colors.overlay,
      height = 28,
      border_width = 2,
    },
  })

  sbar.add("item", "space.padding." .. sid, "left", { width = settings.group_paddings })

  items[sid]:subscribe("mouse.clicked", function()
    sbar.exec(settings.aerospace .. " workspace " .. sid)
  end)
end

local function refresh(focused)
  sbar.exec(settings.aerospace .. " list-windows --all --format '%{workspace}|%{app-name}'", function(out)
    local apps = {}
    for line in tostring(out or ""):gmatch("[^\r\n]+") do
      local ws, app = line:match("^(%d+)|(.+)$")
      if ws then
        ws = tonumber(ws)
        apps[ws] = apps[ws] or {}
        table.insert(apps[ws], app_icons[app] or default_icon)
      end
    end
    for sid = 1, settings.workspaces do
      local is_focused = focused == tostring(sid)
      items[sid]:set({
        icon = { highlight = is_focused },
        label = {
          string = apps[sid] and table.concat(apps[sid], " ") or "—",
          highlight = is_focused,
        },
        background = { border_color = is_focused and colors.base or colors.overlay },
      })
      brackets[sid]:set({
        background = { border_color = is_focused and colors.iris or colors.overlay },
      })
    end
  end)
end

local function update(env)
  if env and env.FOCUSED_WORKSPACE then
    refresh(env.FOCUSED_WORKSPACE)
  else
    sbar.exec(settings.aerospace .. " list-workspaces --focused", function(out)
      refresh((out or ""):match("%S+"))
    end)
  end
end

-- One controller item drives all workspaces. aerospace only fires the workspace event
-- (see ~/.aerospace.toml), so a slow poll keeps app icons current when windows open/close.
local controller = sbar.add("item", "spaces.controller", "left", {
  drawing = false,
  updates = true,
  update_freq = 5,
})
controller:subscribe({ "aerospace_workspace_change", "aerospace_window_change", "routine", "forced", "system_woke" }, update)

update()
