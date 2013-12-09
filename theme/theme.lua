local awful = require("awful")


theme = {}

theme.icon_dir      = awful.util.getdir("config") .. "/icons"

theme.font          = "Terminus 8"

theme.bg_normal     = "#000000AA"
theme.bg_focus      = "#33AEBD"
theme.bg_urgent     = "#C30171"
theme.bg_minimize   = "#00000022"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#ffffff"
theme.fg_focus      = "#f0f0f0"
theme.fg_urgent     = "#F5643F"
theme.fg_minimize   = "#ffffff"

theme.border_width  = 2
theme.border_normal = "#36AEBC"
theme.border_focus  = "#FD3D30"
theme.border_marked = "#FFAAAA"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = theme.icon_dir .. "/square_a.png"
theme.taglist_squares_unsel = theme.icon_dir .. "/square_b.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.icon_dir .. "/submenu.png"
theme.menu_height = 15
theme.menu_width  = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal              = theme.icon_dir .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.icon_dir .. "/titlebar/close_focus.png"

--[[
theme.titlebar_ontop_button_normal_inactive     = theme.icon_dir .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.icon_dir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.icon_dir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.icon_dir .. "/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = theme.icon_dir .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.icon_dir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.icon_dir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.icon_dir .. "/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = theme.icon_dir .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.icon_dir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.icon_dir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.icon_dir .. "/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.icon_dir .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.icon_dir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.icon_dir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.icon_dir .. "/titlebar/maximized_focus_active.png"
--]]

-- theme.wallpaper                                 = theme.icon_dir .. "/background.png"
theme.wallpaper = "~/.wallpaper"

-- You can use your own layout icons like this:
theme.layout_fairh      = theme.icon_dir .. "/fairh.png"
theme.layout_fairv      = theme.icon_dir .. "/fairv.png"
theme.layout_floating   = theme.icon_dir .. "/floating.png"
theme.layout_magnifier  = theme.icon_dir .. "/magnifier.png"
theme.layout_max        = theme.icon_dir .. "/max.png"
theme.layout_fullscreen = theme.icon_dir .. "/fullscreen.png"
theme.layout_tilebottom = theme.icon_dir .. "/tilebottom.png"
theme.layout_tileleft   = theme.icon_dir .. "/tileleft.png"
theme.layout_tile       = theme.icon_dir .. "/tile.png"
theme.layout_tiletop    = theme.icon_dir .. "/tiletop.png"
theme.layout_spiral     = theme.icon_dir .. "/spiral.png"
theme.layout_dwindle    = theme.icon_dir .. "/dwindle.png"

theme.awesome_icon      = "/usr/share/awesome/icons/awesome16.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

theme.useless_gap_width = 5

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
