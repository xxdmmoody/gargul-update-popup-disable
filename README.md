# gargul-update-popup-disable

THIS IS NOT A VERSION OF GARGUL I DID NOT WRITE GARGUL I AM NOT THE AUTHOR OF GARGUL

These are instructions on how to remove the Gargul addon's "update Gargul!" notification that pops up in the center of the screen and lingers for way too long.

This code works with Gargul version 5.3.1

**I did not write Gargul, I do not own Gargul and I am not affiliated with Gargul or the authors of the addon in any way at all.**
**That being said, I did write the ~6 lines of code below all by myself like a big boy**

This is intended to be a set of instructions on how to modify your version of Gargul, please do not attempt to use this to copy and redistribute your own version of the addon, that takes time, money and resources away from the developer of the original addon.

I tried to ask the author of the addon to put this simple fix into the addon but they very clearly (and rudely) stated that this is not something they want to implement despite it being a super simple fix requested multiple times by many people, so I wanted to make it available for anyone else that is annoyed by the popup whenever it happens.

This is very easy to implement and can be done in a few seconds, but I am not smart enough to figure out how to do this automatically any time the addon updates. 

Fortunately, you can manually modify your existing local files (this might seem like a lot especially if you're unfamiliar with code):

NOTE: line numbers are current as of gargul version 5.3.3

1. Open your Gargul folder in your Wow addons folder
2. Open \Gargul\Interface\Settings\General.lua in a code editor or even notepad.
3. Copy and paste this below line 43 (aka, press enter on line 43 and paste this code there, taking note to keep the comma):

```
,{
    label = "Disable new update pop-up window",
    description = "This will hide the on-screen popup from showing when your version of Gargul is out of date",
    setting = "noUpdatePopup"}, 
}
```
4. Open \Gargul\Classes\Version.lua
5. Copy this if statement below after line 279 (so, hit enter on line 279 and then paste this):
```
if (GL.Settings:get("noUpdatePopup")) then
  return;
end
```
            

*What does this do?* This creates an entry in the General settings of Gargul for enabling/disabling the popup, and then the code here is modified so that if the setting is enabled, you still get the chat message telling you you're out of date but doesn't pop with the super annoying popup :)

Disclaimer: Once again, this is not code, this is not a WoW addon, this is just a set of instructions created to help people disable the obnoxious popup. I didn't write Gargul, it is not mine, I am not claiming it to be mine.

