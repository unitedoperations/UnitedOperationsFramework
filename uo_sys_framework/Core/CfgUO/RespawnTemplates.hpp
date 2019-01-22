class UO_FW_RespawnTemplates {
    respawnTemplatesNone[] = {};
    respawnTemplatesUnlimited[] = {"UO_FW_RTemplatesS_InstantDeath","UO_FW_RTemplatesS_SafeStart","UO_FW_RTemplatesS_Gear","UO_FW_RTemplatesS_CoverMap","UO_FW_RTemplatesS_MapAndCompassRemover"};
    respawnTemplatesIndTick[] = {"UO_FW_RTemplatesS_InstantDeath","UO_FW_RTemplatesS_SafeStart","UO_FW_RTemplatesS_Gear","UO_FW_RTemplatesS_CoverMap","UO_FW_RTemplatesS_MapAndCompassRemover"};
    respawnTemplatesTeamTick[] = {"UO_FW_RTemplatesS_InstantDeath","UO_FW_RTemplatesS_SafeStart","UO_FW_RTemplatesS_Gear","UO_FW_RTemplatesS_CoverMap","UO_FW_RTemplatesS_MapAndCompassRemover"};
    respawnTemplatesWave[] = {"UO_FW_RTemplatesS_InstantDeath","UO_FW_RTemplatesS_SafeStart","UO_FW_RTemplatesS_Gear","UO_FW_RTemplatesS_CoverMap","UO_FW_RTemplatesS_MapAndCompassRemover"};
    respawnTemplatesTriggered[] = {"UO_FW_RTemplatesS_InstantDeath","UO_FW_RTemplatesS_SafeStart","UO_FW_RTemplatesS_Gear","UO_FW_RTemplatesS_CoverMap","UO_FW_RTemplatesS_MapAndCompassRemover"};
    class UO_FW_RTemplatesS_InstantDeath {
        displayName = "Instant Death Effect";
        respawnTypes[] = {0,1,2,3,4,5};
    };
    class UO_FW_RTemplatesS_SafeStart {
        displayName = "Executes SafeStart Module Settings";
        respawnTypes[] = {1,2,3,4,5};
    };
    class UO_FW_RTemplatesS_CoverMap {
        displayName = "Executes CoverMap Unit Settings";
        respawnTypes[] = {1,2,3,4,5};
    };
    class UO_FW_RTemplatesS_TeamColour {
        displayName = "Executes TeamColour Unit Settings";
        respawnTypes[] = {1,2,3,4,5};
    };
    class UO_FW_RTemplatesS_StartInParachute {
        displayName = "Executes StartInParachute Unit Settings";
        respawnTypes[] = {1,2,3,4,5};
    };
    class UO_FW_RTemplatesS_Gear {
        displayName = "Executes Gear Unit Settings";
        respawnTypes[] = {1,2,3,4,5};
    };
    class UO_FW_RTemplatesS_MapAndCompassRemover {
        displayName = "Executes MapAndCompassRemover Unit Settings";
        respawnTypes[] = {1,2,3,4,5};
    };
    //class UO_FW_RTemplatesS_GearHandle {
    //    displayName = "Handle Gear Classes for Wave Respawns";
    //    respawnTypes[] = {4};
    //};
    //class UO_FW_RTemplatesS_TriggerReset {
    //    displayName = "Reset Trigger Variable after Spawning a Wave/Queue of Players";
    //    respawnTypes[] = {5};
    //};
};
