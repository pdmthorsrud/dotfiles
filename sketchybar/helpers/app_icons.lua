-- Nerd Font glyphs (FiraCode Nerd Font) instead of the reference's sketchybar-app-font
-- ligatures (":code:" etc.), since that font isn't installed. The original mapping is
-- in git history of hrtowii/dotfiles (helpers/app_icons.lua).
local icons = {
  ["Firefox"] = "\u{f269}",
  ["Zen"] = "\u{f0ac}",
  ["Dia"] = "\u{f0ac}",
  ["Safari"] = "\u{f267}",
  ["Microsoft Edge"] = "\u{f0ac}",
  ["iTerm"] = "\u{f120}",
  ["iTerm2"] = "\u{f120}",
  ["Terminal"] = "\u{f120}",
  ["Code"] = "\u{e70c}",
  ["Code - Insiders"] = "\u{e70c}",
  ["Visual Studio Code"] = "\u{e70c}",
  ["Slack"] = "\u{f198}",
  ["Spotify"] = "\u{f1bc}",
  ["Notion"] = "\u{f24a}", -- fa-sticky-note-o
  ["Claude"] = "\u{f069}", -- fa-asterisk
  ["Microsoft Outlook"] = "\u{f0d22}", -- nf-md-microsoft_outlook
}

-- Anything unmapped gets a generic window icon instead of "?"
return setmetatable(icons, {
  __index = function()
    return "\u{f2d0}"
  end,
})
