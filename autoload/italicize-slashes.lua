local tr = aegisub.gettext

script_name = tr"Italicize Slashes"
script_description = tr"Italicize lines that begin with a forward slash, then remove the slash"
script_author = "Jacob Albano"
script_version = "1"

function doIt(subs, sel)
    for _, i in ipairs(sel) do
        local line = subs[i]
		local rStart, rEnd = line.text:find("^%s*/%s*")
		if (rEnd ~= nil) then
			line.text = "{\\i1}" .. line.text:sub(rEnd + 1) .. "{\\i0}"
			subs[i] = line
		end
    end
    aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, doIt)

