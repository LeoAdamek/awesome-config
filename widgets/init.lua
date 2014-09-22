--[[

   Widgets Library
   
   Provides some neat (however not amazinly customizable) widgets.

   GNU LGPL
   Leo Adamek, not copyright, no rights reserved.

--]]

package.loaded.widgets = nil

local widgets = {
   memory = require("widgets.memory"),
   wireless = require("widgets.wireless"),
   battery = require("widgets.battery"),
   process_memory = require("widgets.process_memory")
}


return widgets
