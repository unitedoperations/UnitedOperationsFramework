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

class UO_FW_JIPCategory {
    displayName = "JiP Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_JIP_DENYTIME {
            property = "UO_FW_JIP_DENYTIME";
            displayName = "Deny Time";
            tooltip = "After how many minutes should a player be considered JIP";
            control = "UO_FW_5To20_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "5";
        };
        class UO_FW_JIP_EXPIRETIME {
            property = "UO_FW_JIP_EXPIRETIME";
            displayName = "Expire Time";
            tooltip = "After how many minutes JiPs will no longer have teleport or transport actions.";
            control = "UO_FW_5To20_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "5";
        };
        class UO_FW_JIP_EnemyDISTANCE {
            property = "UO_FW_JIP_EnemyDISTANCE";
            displayName = "Nearby Enemy Distance";
            tooltip = "Denies teleport action if the distance between enemies and the intended teleport location is less than this value in metres";
            control = "UO_FW_50To200Step50_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "100";
        };
    };
};
