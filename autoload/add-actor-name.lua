local tr = aegisub.gettext

script_name = tr"Add Actor Name"
script_description = tr"Add the actor name to the text line"
script_author = "Jacob Albano"
script_version = "1"

function doit(subs, sel)
    for _, i in ipairs(sel) do
        local line = subs[i]
        line.text = "{\\actor1}" .. line.actor .. "{\\actor0}" .. line.text
        subs[i] = line
    end
    aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, doit)

