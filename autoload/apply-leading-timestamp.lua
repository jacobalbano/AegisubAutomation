local tr = aegisub.gettext

script_name = tr"Apply Leading Timestamp"
script_description = tr"Look for a timestamp like 0:10 in the line and move it to the timing"
script_author = "Jacob Albano"
script_version = "1"

local pattern = "(%d*):(%d%d)"

function string.trim(s)
  return s:match("^%s*(.-)%s*$")
end

function timeStrToMs(str)
  local min, sec = str:match(pattern)
  if min == nil or sec == nill then return 0 end
  sec = sec + min * 60
  return sec * 1000
end

function splitLeadingTimeString(str)
  local a, b = str:find(pattern)
  if (a == nil or b == nil) then return nil, nil end
  return
    str:sub(a, b):trim(),
    str:sub(b + 1):trim()
end

function doit(subs, sel)
    for _, i in ipairs(sel) do
        local line = subs[i]
		local timestr, text = splitLeadingTimeString(line.text)
		
		if timestr ~= nil and text ~= nil then
			local t = timeStrToMs(timestr)
			line.start_time = t
			line.end_time = t
			line.text = text
			subs[i] = line
		end
    end
    aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, doit)

