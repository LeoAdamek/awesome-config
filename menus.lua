local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

-- Menu
mymainmenu = awful.menu({
      items = { { "awesome", myawesomemenu },
         { "open terminal", terminal },
         { "emacs client" , "emacsclient -nc" },
         { "file browser" , "thunar" },
         { "htop"         , terminal .. " -e htop" }

         -- You could add your own commands here.
      }
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

