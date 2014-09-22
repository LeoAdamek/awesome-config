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

--}}}

-- Module name
module("widgets.process_memory")

-- {{{ Read the %mem from PS
local function get_process_mempercent(pid)
   local mem_percent = nil
   local f = io.popen("ps -o%mem= " .. pid)

   mem_percent = f:read("*all")
   f:close()

   return mem_percent
end

-- }}}


-- {{{ Worker to read percentage
local function worker(pid)
   
   local val = get_process_mempercent(pid)
   
   if val then
      return {tonumber(val)}
   end

   return {0}
end
-- }}}

--- I'm 12 and what is this?
setmetatable(_M, { __call = function(_, ...) return worker(...) end})
