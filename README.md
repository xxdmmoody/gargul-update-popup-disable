# gargul-update-popup-disable
Repository for the code that disables the Gargul addon's "update Gargul!" notification that pops up in the center of the screen and lingers for way too long.


I did not write Gargul, I do not own Gargul and I am not affiliated with Gargul or the authors of the addon in any way at all. 

I tried to ask the author of the addon to put this simple fix into the addon but they very clearly stated that this is not something they want to implement despite it being a super simple fix, so I wanted to make it available for anyone else that is annoyed by the popup whenever it happens.

This is very easy to implement and can be done in a few seconds, but I am not smart enough to figure out how to do this automatically any time the addon updates. 

1. Open your Gargul folder in your Wow addons folder
2. Open \Gargul\Interface\Settings\General.lua in a code editor or even notepad.
3. Add the following object to the "Overfiew:drawCheckboxes" function:
`{
            label = "Disable new update pop-up window",
            description = "This will hide the on-screen popup from showing when your version of Gargul is out of date",
            setting = "noUpdatePopup"

        },`
