local tr = aegisub.gettext

script_name = tr"Copy Timestamps Downward"
script_description = tr"Copies the timestamps of the first selected line to all those below it"
script_author = "Jacob Albano"
script_version = "1"

function doIt(subs, sel)
	local start_time = nil
	local end_time = nil
    for _, i in ipairs(sel) do
        local line = subs[i]
		if (start_time == nil) then
			start_time = line.start_time
			end_time = line.end_time
		end
        
		line.start_time = start_time
		line.end_time = end_time
		
        subs[i] = line
    end
    aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, doIt)

