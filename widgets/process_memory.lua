--[[

Widget to the the memory usage of a single process

- Leo Adamek

--]]

--{{{ Environment

local io = {popen = io.popen}
local os = {getenv = os.getenv}

local tonumber = tonumber
local setmetatable = setmetatable
local type = type
local async = require('helpers.async')

--}}}

local process_memory = {}

local function worker(format, pid)

   --local percent = awful.util.pread("ps -o%mem= " .. pid)
   local req = helpers.async.command(os.getenv("HOME") , "ps -o%mem= " .. pid)
   
   req.connect_signal('newline::stdout', function(str)
                         return {str}
   end)
end


-- I'm 12 and what is this?
return setmetatable(process_memory, {__call = function(_,...) return worker(...) end})


