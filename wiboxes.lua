local awful = require("awful")
local wibox = require("wibox")
local vicious = require("vicious")
local lain = require("lain")
local theme = require("beautiful")

-- {{{ Wibox
-- Create a textclock widget
clock_widget = awful.widget.textclock("DATE %Y/%m/%d @ %H:%M:%S", 1)

--[[
-- Memory %
mymemory = wibox.widget.textbox()
vicious.register(mymemory , vicious.widgets.mem , "RAM $1% ($2MB/$3MB) :: " , 1)

n-- CPU %
mycpu = wibox.widget.textbox()
vicious.register(mycpu , vicious.widgets.cpu,  " $1% (CPU) :: ", 1)
--]]

markup = lain.util.markup

-- Spacer Widget
-- Something to go between widgets
spacer = wibox.widget.textbox(" ╱ ")


-- Battery Widget
-- Only active if we have a battery
battery_widget = lain.widgets.bat(
   {
      settings = function()
         if bat_now.perc == "N/A" then
            bat_now.perc = "AC"
         else
            bat_now.prc = bat_now.perc .. "%"
         end

         widget:set_text( "PWR: " .. bat_now.perc )
      end
   }
)

-- CPU Widget
cpu_icon   = wibox.widget.imagebox(theme.widget_cpu)
cpu_widget = lain.widgets.cpu(
   {
      settings = function()
         widget:set_markup(
            markup("#E33A6E" , cpu_now.usage .. "%" )
         )
      end
   }
)

-- System Temperature
-- This won't work on Virtual Machines!
temperature_icon   = wibox.widget.imagebox(theme.widget_temperature)
temperature_widget = lain.widgets.temp(
   {
      settings = function()
         widget:set_markup(
            markup("#F1AF5F" , coretemp_now .. "°C")
         )
      end
   }
)

-- Network Widgets
-- network Tx/Rx
net_rx_icon   = wibox.widget.imagebox(theme.widget_network_rx)
net_rx_widget = wibox.widget.textbox()

net_tx_icon   = wibox.widget.imagebox(theme.widget_network_tx)
net_tx_widget = lain.widgets.net(
   {
      settings = function()
         widget:set_markup(
            markup("#E54C62" , net_now.sent)
         )

         net_rx_widget:set_markup(
            markup("#87AF5F" , net_now.received)
         )
      end
   }
)

-- Memory
memory_icon   = wibox.widget.imagebox(theme.widget_memory)
memory_widget = lain.widgets.mem(
   {
      settings = function()
         widget:set_markup(
            markup("#E0DA37" , mem_now.used .. "M")
          )
       end
    }
 )

 -- Widgets to go on the right (left-to-right)
 -- To be interleaved with the spacer
 right_widgets = {
    net_tx_icon,
    net_tx_widget,

    spacer,

    net_rx_icon,
    net_rx_widget,
    
    spacer,

    memory_icon,
    memory_widget,

    spacer,

    cpu_icon,
    cpu_widget,

    spacer,

--    battery_widget,

    temperature_widget,

    spacer,

    clock_widget
 }




 -- Create a wibox for each screen and add it
 mywibox = {}
 mypromptbox = {}
 mylayoutbox = {}
 mytaglist = {}
 mytaglist.buttons = awful.util.table.join(
                     awful.button({ }, 1, awful.tag.viewonly),
                     awful.button({ modkey }, 1, awful.client.movetotag),
                     awful.button({ }, 3, awful.tag.viewtoggle),
                     awful.button({ modkey }, 3, awful.client.toggletag),
                     awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                     awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                     )

 for s = 1, screen.count() do
     -- Create a promptbox for each screen
     mypromptbox[s] = awful.widget.prompt()
     -- Create an imagebox widget which will contains an icon indicating which layout we're using.
     -- We need one layoutbox per screen.
     mylayoutbox[s] = awful.widget.layoutbox(s)
     mylayoutbox[s]:buttons(awful.util.table.join(
                            awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                            awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                            awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                            awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
     -- Create a taglist widget
     mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

     -- Create the wibox
     mywibox[s] = awful.wibox({ position = "top", screen = s })

     -- Widgets that are aligned to the left
     local left_layout = wibox.layout.fixed.horizontal()
     left_layout:add(mylayoutbox[s])
     left_layout:add(mytaglist[s])
     left_layout:add(mypromptbox[s])

     -- Widgets that are aligned to the right
     local right_layout = wibox.layout.fixed.horizontal()
     if s == 1 then right_layout:add(wibox.widget.systray()) end

     for k,w in ipairs(right_widgets) do
        right_layout:add(w)
     end

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}
