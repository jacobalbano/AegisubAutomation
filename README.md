# AegisubAutomation
Personal collection of aegisub automation scripts

Check out this repository into `%appdata%\Aegisub\automation`

## Add Actor Name
_Applies to selection_  
Take the actor field and add it to the beginning of the line.  
Text is enclosed in tags for easy find/replace support.

## Apply Leading Timestamp
_Applies to selection_  
Looks for lines which begin with something that looks like a timestamp, e.g. `0:10`, and assigns that value to the `start_time` and `end_time` values.  
I use this when transcribing to help with timing for visual-only text that doesn't have an audio cue for me to work with.

## Copy Timestamp Downward
_Applies to selection_  
Copies the timestamp of the first selected line and copies it to everything else.

## Italicize All
_Applies to selection_  
Encloses the entire text of the line in italic tags.  
Made somewhat redundant by `Italicize Slashes`

## Italicize Slashes
_Applies to selection_  
Italicize the entire text of any line that begins with a forward slash (`/`), then removes the slash.  
I use this slash shorthand when transcribing to mark inner monologue etc, so I don't miss it when timing/formatting later.
