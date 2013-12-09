-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")
local vicious = require("vicious")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

-- Notifications & Error Handling
dofile( awful.util.getdir("config") .. "/naughty.lua" )

-- Main Options
dofile( awful.util.getdir("config") .. "/options.lua" )

-- Menus
dofile( awful.util.getdir("config") .. "/menus.lua" )

-- Wibox
dofile( awful.util.getdir("config") .. "/wibox.lua" )

-- Signals
dofile( awful.util.getdir("config") .. "/signals.lua" )

-- Bindings
dofile( awful.util.getdir("config") .. "/bindings.lua" )

-- Rules
dofile( awful.util.getdir("config") .. "/rules.lua" )
