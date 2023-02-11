-- Replace the existing file in Gargul\Interface\Settings
-- I am not the author of this code, I am not claiming to be the author, I am making no money or otherwise benefitting from this in any way
-- I am not affiliated with Gargul and this code is not associated or endorsed by the author of Gargul

---@type GL
local _, GL = ...;

---@type SettingsOverview
local Overview = GL.Interface.Settings.Overview;

---@class GeneralSettings
GL.Interface.Settings.General = {};

---@type GeneralSettings
local General = GL.Interface.Settings.General;

---@return void
function General:draw(Parent)
    GL:debug("GeneralSettings:draw");

    Overview:drawCheckboxes({
        {
            label = "Welcome message",
            description = "Show a message when booting Gargul",
            setting = "welcomeMessage",
        },
        {
            label = "Minimap Icon",
            setting = "showMinimapButton",
            callback = function()
                GL.MinimapButton:drawOrHide();
            end,
        },
        {
            label = "Show changelog",
            description = "Enable or disable the changelog which displays important update details after updating Gargul",
            setting = "changeLog",
        },
        {
            label = "No messages",
            description = "This will prevent Gargul from posting any messages, ANYWHERE",
            setting = "noMessages",
        },
        {
            label = "Disable new update pop-up window",
            description = "This will hide the on-screen popup from showing when your version of Gargul is out of date",
            setting = "noUpdatePopup"

        },
        {
            label = "No sounds",
            setting = "noSounds",
        },
    }, Parent);

    local Spacer = GL.AceGUI:Create("SimpleGroup");
    Spacer:SetLayout("FILL");
    Spacer:SetFullWidth(true);
    Spacer:SetHeight(20);
    Parent:AddChild(Spacer);

    local MinimumQualityLabel = GL.AceGUI:Create("Label");
    MinimumQualityLabel:SetColor(1, .95686, .40784);
    MinimumQualityLabel:SetText("On which channel should Gargul output its sounds (default SFX)");
    MinimumQualityLabel:SetHeight(20);
    MinimumQualityLabel:SetFullWidth(true);
    Parent:AddChild(MinimumQualityLabel);

    local SoundChannels = {
        Master = "Master",
        Music = "Music",
        SFX = "SFX",
        Ambience = "Ambience",
        Dialog = "Dialog",
    };

    local SoundChannelDropdown = GL.AceGUI:Create("Dropdown");
    SoundChannelDropdown:SetValue(GL.Settings:get("soundChannel"));
    SoundChannelDropdown:SetList(SoundChannels);
    SoundChannelDropdown:SetText(GL.Settings:get("soundChannel"));
    SoundChannelDropdown:SetWidth(250);
    SoundChannelDropdown:SetCallback("OnValueChanged", function()
        local channel = SoundChannelDropdown:GetValue();
        GL.Settings:set("soundChannel", channel);
    end);
    Parent:AddChild(SoundChannelDropdown);
end

GL:debug("Interface/Settings/General.lua");
