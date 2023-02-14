# gargul-update-popup-disable

THIS IS NOT A VERSION OF GARGUL I DID NOT WRITE GARGUL I AM NOT THE AUTHOR OF GARGUL (BUT IF I WAS I WOULDNT BE A JERK TO USERS OF THE ADDON LMAO)

Repository for the code that disables the Gargul addon's "update Gargul!" notification that pops up in the center of the screen and lingers for way too long.

This code works with Gargul version 5.3.1

**I did not write Gargul, I do not own Gargul and I am not affiliated with Gargul or the authors of the addon in any way at all.**

I tried to ask the author of the addon to put this simple fix into the addon but they very clearly (and rudely) stated that this is not something they want to implement despite it being a super simple fix requested multiple times by many people, so I wanted to make it available for anyone else that is annoyed by the popup whenever it happens.

This is very easy to implement and can be done in a few seconds, but I am not smart enough to figure out how to do this automatically any time the addon updates. 

You have 2 options here: copy the files from this repository:
1. General.lua replaces the file in \Gargul\Interface\Settings
2. Version.lua replaces the file in \Gargul\Classes\Version.lua
3. Download each file, copy and paste them into the above directories.

Or, you can manually modify the existing files (this might seem like a lot especially if you're unfamiliar with code):

1. Open your Gargul folder in your Wow addons folder
2. Open \Gargul\Interface\Settings\General.lua in a code editor or even notepad.
3. Add the following object to the "Overview:drawCheckboxes" function (I personally put it above the SFX option):

```
{
    label = "Disable new update pop-up window",
    description = "This will hide the on-screen popup from showing when your version of Gargul is out of date",
    setting = "noUpdatePopup"}, 
}
```
4. Open \Gargul\Classes\Version.lua
5. Copy this if statement below:
```
if (GL.Settings:get("noUpdatePopup")) then
  return;
end
```
            
7. In the function named "Version:notifyOfUpdate", modify the local function notifyUpdate by adding the if statement you just copied into the middle of the function as shown below:
```
local notifyOfUpdate = function ()
            GL:warning("A new version of |c00a79effGargul|r is available. Make sure to update!");
            
            if (GL.Settings:get("noUpdatePopup")) then
                return;
            end

            GL.Interface.Alerts:fire("GargulNotification", {
                message = string.format("|c00BE3333Update Gargul!|r"),
            });
        end
```

*What does this do?* This creates an entry in the General settings of Gargul for enabling/disabling the popup, and then the code here is modified so that if the setting is enabled, you still get the chat message telling you you're out of date but doesn't pop with the super annoying popup :)

