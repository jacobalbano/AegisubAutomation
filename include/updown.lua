function updown(collection)
   local count = #collection
   local up = 0
   local down = count + 1
   return function ()
      up = up + 1
      down = down - 1
      if up <= count then return up, down end
   end
end