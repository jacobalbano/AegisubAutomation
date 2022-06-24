local tr = aegisub.gettext

script_name = tr"Italicize All"
script_description = tr"Set italics on all selected lines"
script_author = "Jacob Albano"
script_version = "1"

function doIt(subs, sel)
    for _, i in ipairs(sel) do
        local line = subs[i]
        line.text = "{\\i1}" .. line.text .. "{\\i0}"
        subs[i] = line
    end
    aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, doIt)

