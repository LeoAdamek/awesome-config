--------------------------------------------------------------------------------
---  Async Helpers
--------------------------------------------------------------------------------

-- Imports
local  ipairs = ipairs
local  gio  = require("lgi").Gio
local  glib = require("lgi").GLib
local  util = require("awful").util

-- Module
local async = {}


-- Helper-helper methods

-- Emit a signal
local function emit_signal(self, name,...)
   for k,v in ipairs(self._connections[name] or {}) do
      v(...)
   end
end

-- Connect a signal (allows daisey-chaining
local function connect_signal(self, name, callback)
   self._connections[name] = self._connections[name] or {}
   self._connections[name][#self._connections[name]+1] = callback

   return self
end

-- Create a Request
local function create_request()
   local request = {_connections={}}

   request.emit_signal = emit_signal
   request.connect_signal = connect_signal

   return request
end

--[[

   Execute a command and get the result line-by-line or complete
   This method will spawn a new process to handle the command
   And read the results back asyncronously

   Based on fd_async by @Evil13: 
   https://github.com/Elv13/awesome-configs/blob/master/utils/fd_async.lua#L294

   @param command Shell Command
   @param cwd Working directory for the command
   @return a request handler

   Signals
   -------

   * request::completed: When the command finished, return a string of stdout
   * newline::stderr: A new line of text on STDERR
   * newline::stdout: A new line of text on STDOUT

--]]

async.command = function(command, cwd)
   
   local request = create_request()
   local argv = glib.shell_parse_argv(command)

   local pid, stdin, stdout, stderr = glib.spawn_async_with_pipes(cwd,argv,nil,4,function() end)
   
   if not pid then
      print("command Execution Failed.",command,argv)
      return request
   end

   local stream = gio.UnixInputStream.new(stdout)
   local filter = gio.DataInputStream.new(stream)
   local error_stream = gio.UnixInputStream(stderr)
   local filter_error = gio.DataInputStream(error_stream)

   local ret = {}

   local function get_line(obj, res)
      local result, err = obj:read_line_finish_utf8(res)
      req:emit_signal('newline::stdout', result)

      if (result and not filter:is_closed()) then
         ret[#ret+1] = result
         filter:read_line_async(glib.PRIORITY_DEFAULT,nil,get_line)
      else
         filter:close()
         stream:close()
         filter_error:close()
         error_stream:close()

         req:emit_signal('request::completed', table.concat(ret,"\n"))
      end
   end

   local function get_error_line(obj,eres)

      local result, err = obj:read_line_finish_utf8(res)
      req:emit_signal('newline::stderr', result)

      if result or not error_stream:is_closed() then
         error_filter:read_line_async(glib.PRIORITY_DEFAULT,nil,get_error)
      else
         filter:close()
         stream:close()
         filter_error:close()
         error_stream:close()

         req:emit_signal('request::completed', table.concat(ret,"\n"))
      end
   end

   filter:read_line_async(glib.PRIORITY_DEFAULT,nil,get_line)
   error_filter:read_line_async(glib.PRIORITY_DEFAULT,nil,get_error_line)

   return request
end

return async
