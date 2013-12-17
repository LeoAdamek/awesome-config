--[[

   Wireless widget
   
   Leo Adamek
   
--]]

local awful   = require("awful")
local wibox   = require("wibox")
local vicious = require("vicious")
local theme   = require("beautiful")

local widget  = wibox.layout.fixed.horizontal()
local text    = wibox.widget.textbox()
local icon    = wibox.widget.imagebox(theme.widget_wireless)

local tooltip

-- Maximum length 22 (16 for SSID + space + 100%)
-- 
text.fit = function() return 100 , 22 end

vicious.register(
   text,
   vicious.widgets.wifi,
   "${ssid} ${linp}%",
   10,
   "wlp4s0"
)

-- Create the tooltip
--[[ Disabled: It breaks stuff
tooltip = awful.tooltip({
                           objects        = { widget },
                           timeout        = 20,
                           timer_function = function()
                              local info  = vicious.widgets.wifi(widget)
                              local title = "Wireless"
                              local text  = ''

                                 text = '<span font-weight="bold">' .. title .. '\n'
                                 .. string.rep('-' , string.len(title)) .. '</span>' .. '\n'
                                 .. '<span>' .. '\n'
                                 .. '* Connected To: ' .. '\n'
                                 .. '* Link Quality: ' .. '\n'
                                 .. '</span>' .. '\n'

                                 

                              return text
                           end
})
--]]

widget:add(icon)
widget:add(text)

return {
   widget = widget
}
                              

