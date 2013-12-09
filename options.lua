local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")
local lain = require("lain")

options = {}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/leo/.config/awesome/theme/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = os.getenv("EDITOR") or "emacs"
editor_cmd = terminal .. " -e " .. editor


-- Table of layouts to cover with awful.layout.inc, order matters.
layouts = {
--    awful.layout.suit.tile,

   lain.layout.uselesstile,

--    awful.layout.suit.tile.left,
   lain.layout.uselesstile.left,

    awful.layout.suit.tile.bottom,
--    awful.layout.suit.tile.top,
   lain.layout.uselesstile.top,

    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating
}

options.layouts = layouts
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Trigrams
    tags[s] = awful.tag( {"☰" , "☱", "☲" , "☳" , "☴"}, s , layouts[1])
end
-- }}}

return options
