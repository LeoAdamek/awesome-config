--[[
   
   Battery Widget

   Leo Adamek, 2013

--]]


local awful = require("awful")
local wibox = require("wibox")
local vicious = require("vicious")
local theme = require("beautiful")


local widget = wibox.layout.fixed.horizontal()
local text   = wibox.widget.textbox()
local icon   = wibox.widget.imagebox(theme.widget_battery)

local tooltip

-- | Fit the text
text.fit = function() return 50,4 end

-- | Register the text with vicious
vicious.register(
   text,
   vicious.widgets.bat,
   "$1 $2%",
   10,
   "BAT0"
)

-- Tooltip
tooltip = awful.tooltip({
                           objects = { widget },
                           timeout = 20,
                           timer_function = function()
                              local info = vicious.widgets.bat(widget, "BAT0")
                              local title = "Battery"
                              local text = ''
                              
                              text = '<span font-weight="bold">' .. title .. '\n'
                                 ..  string.rep('-' , string.len(title)) .. '\n'
                                 .. '</span>' .. '\n'
                                 .. '<span>' .. '\n'
                                 .. '* Battery State: ' .. info[1] .. '\n'
                                 .. '*  Charge Level: ' .. info[2] .. '%' .. '\n'
                                 .. '*   T Remaining: ' .. info[3] .. '\n'
                                 .. '</span>'

                              return text
                           end
})

widget:add(icon)
widget:add(text)

return {
   widget = widget
}



