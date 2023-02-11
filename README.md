# gargul-update-popup-disable
Repository for the code that disables the Gargul addon's "update Gargul!" notification that pops up in the center of the screen and lingers for way too long.


I did not write Gargul, I do not own Gargul and I am not affiliated with Gargul or the authors of the addon in any way at all. 

I tried to ask the author of the addon to put this simple fix into the addon but they very clearly stated that this is not something they want to implement despite it being a super simple fix, so I wanted to make it available for anyone else that is annoyed by the popup whenever it happens.

This is very easy to implement and can be done in a few seconds, but I am not smart enough to figure out how to do this automatically any time the addon updates. 

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
6. ```
if (GL.Settings:get("noUpdatePopup")) then
  return;
end```
            
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

