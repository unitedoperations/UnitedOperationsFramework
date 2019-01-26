class UO_FW_MainRespawnSettings {
    displayName = "General Respawn Settings";
    collapsed = 0; //_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS'],['Wave','WAVE'],['Triggered','TRIGGERED']];\
    class Attributes {
        class UO_FW_RespawnSetting_InstantDeath {
            property = "UO_FW_RespawnSetting_InstantDeath";
            displayName = "Instant Death Screen";
            tooltip = "This setting enables the 'YOU ARE DEAD' screen that shows immediately following a player's death. Disable to enable VR fadeout effect.";
            control = "CheckBox";
            defaultValue = "true";
            expression = UO_FW_SCENARIO_EXPRESSION;
        };
        class UO_FW_RespawnSetting_KillCam {
            property = "UO_FW_RespawnSetting_KillCam";
            displayName = "Killcam";
            tooltip = "This setting enables the specator killcam functionality.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
    };
};
