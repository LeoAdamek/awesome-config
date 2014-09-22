--[[

   Memory Monitor Widget.

   Monitors memory.

   Shows a usage percentage by default.

   Hover over shows:

   - Progressbar
   - Used / Total
   - Top Memory (ab)users

--]]

local vicious = require("vicious")
local wibox   = require("wibox")
local awful   = require("awful")
local theme   = require("beautiful")

local widget  = wibox.layout.fixed.horizontal()
local text    = wibox.widget.textbox()
local icon    = wibox.widget.imagebox(theme.widget_memory)

local tooltip

-- Maximum Length: 4 (for 100%)
text.fit = function() return 20, 4 end

-- Set the text to ${memory_usage_percent}%
vicious.register(
   text,
   vicious.widgets.mem,
   "$1%",
   -- This should be configurable.
   1
)

-- Initialize the tooltip
tooltip = awful.tooltip({
                           objects = { widget },
                           timeout = 20,
                           timer_function = function()
                              local info  = vicious.widgets.mem(widget)
                              local title = "Memory"
                              local text  = ''

                              text = '<span font-weight="bold">' .. title .. '\n'
                                 ..  string.rep('-' , string.len(title)) .. '\n'
                                 .. '</span>' .. '\n'

                              text = text .. '<span>' .. '\n'
                                 ..  '* Memory Used:' .. info[2] .. 'MiB' .. '\n'
                                 ..  '* Memory Free:' .. info[3] .. 'MiB' .. '\n'
                                 ..  '</span>'

                              return text
                           end
})

widget:add(icon)
widget:add(text)

return {
   widget = widget
}
                              
