require "updown"
require "stringy"

local tr = aegisub.gettext

script_name = tr"Apply Leading Timestamp"
script_description = tr"Look for a timestamp like 0:10 in the line and move it to the timing"
script_author = "Jacob Albano"
script_version = "1"

function timePartsToMs(parts)
  local seconds = 0
  for i, j in updown(parts) do
  	seconds = seconds + parts[i] * 60 ^ (j - 1)
  end

  return seconds * 1000
end

function splitLeadingTimeString(str)
  local ts, rest = str:match("^(%s*%d*:?%d?%d:%d%d%s*)(.-)$")
  if (ts == nil) then return nil, nil end
  
  local array = {}
  for cap in ts:gmatch("(%d*)") do
    table.insert(array, tonumber(cap))
  end

  return array, rest
end

function doit(subs, sel)
    for _, i in ipairs(sel) do
        local line = subs[i]
		local parts, text = splitLeadingTimeString(line.text)
		
		if parts ~= nil and #parts > 1 then -- don't support seconds only
			local t = timePartsToMs(parts)
			line.start_time = t
			line.end_time = t + 100
			line.text = text:trim()
			subs[i] = line
		end
    end
    aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, doit)

