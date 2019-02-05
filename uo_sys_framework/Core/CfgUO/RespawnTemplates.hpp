class UO_FW_RespawnTemplates {
    respawnTemplatesNone[] = {};
    respawnTemplatesUnlimited[] = {"UO_FW_RTemplatesS_JoinGroup","UO_FW_RTemplatesS_SafeStart","UO_FW_RTemplatesS_ACRE","UO_FW_RTemplatesS_Gear","UO_FW_RTemplatesS_CoverMap","UO_FW_RTemplatesS_MapAndCompassRemover"};
    respawnTemplatesIndTick[] = {"UO_FW_RTemplatesS_JoinGroup","UO_FW_RTemplatesS_SafeStart","UO_FW_RTemplatesS_ACRE","UO_FW_RTemplatesS_Gear","UO_FW_RTemplatesS_CoverMap","UO_FW_RTemplatesS_MapAndCompassRemover"};
    respawnTemplatesTeamTick[] = {"UO_FW_RTemplatesS_JoinGroup","UO_FW_RTemplatesS_SafeStart","UO_FW_RTemplatesS_ACRE","UO_FW_RTemplatesS_Gear","UO_FW_RTemplatesS_CoverMap","UO_FW_RTemplatesS_MapAndCompassRemover"};
    respawnTemplatesWave[] = {"UO_FW_RTemplatesS_JoinGroup","UO_FW_RTemplatesS_SafeStart","UO_FW_RTemplatesS_ACRE","UO_FW_RTemplatesS_Gear","UO_FW_RTemplatesS_CoverMap","UO_FW_RTemplatesS_MapAndCompassRemover"};
    respawnTemplatesTriggered[] = {"UO_FW_RTemplatesS_JoinGroup","UO_FW_RTemplatesS_SafeStart","UO_FW_RTemplatesS_ACRE","UO_FW_RTemplatesS_Gear","UO_FW_RTemplatesS_CoverMap","UO_FW_RTemplatesS_MapAndCompassRemover"};
    class UO_FW_RTemplatesS_JoinGroup {
        displayName = "Rejoin Group on Respawn";
        respawnTypes[] = {1,2,3,5};
    };
    class UO_FW_RTemplatesS_SafeStart {
        displayName = "Run SafeStart Module Settings on Respawn";
        respawnTypes[] = {1,2,3,4,5};
    };
    class UO_FW_RTemplatesS_CoverMap {
        displayName = "Run Unit CoverMap Settings on Respawn";
        respawnTypes[] = {1,2,3,4,5};
    };
    class UO_FW_RTemplatesS_TeamColour {
        displayName = "Run Unit TeamColour Settings on Respawn";
        respawnTypes[] = {1,2,3,4,5};
    };
    class UO_FW_RTemplatesS_StartInParachute {
        displayName = "Run Unit StartInParachute Settings on Respawn";
        respawnTypes[] = {1,2,3,4,5};
    };
    class UO_FW_RTemplatesS_Gear {
        displayName = "Run Unit Gear Settings on Respawn";
        respawnTypes[] = {1,2,3,4,5};
    };
    class UO_FW_RTemplatesS_ACRE {
        displayName = "Run Unit ACRE Settings on Respawn";
        respawnTypes[] = {1,2,3,4,5};
    };
    class UO_FW_RTemplatesS_MapAndCompassRemover {
        displayName = "Run MapAndCompassRemover Unit Settings on Respawn";
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
