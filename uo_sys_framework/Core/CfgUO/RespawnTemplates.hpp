#define UO_FW_RTEMPLATES_GLOBALTYPES respawnTypes[] = {1,2,3,4,5}
#define UO_FW_RTEMPLATES_GLOBALSETTINGSENABLED "UO_FW_RTemplatesS_SafeStart","UO_FW_RTemplatesS_CoverMap","UO_FW_RTemplatesS_MapAndCompassRemover"

class UO_FW_RespawnTemplates {
    respawnTemplatesNone[] = {};
    respawnTemplatesUnlimited[] = {UO_FW_RTEMPLATES_GLOBALSETTINGSENABLED};
    respawnTemplatesIndTick[] = {UO_FW_RTEMPLATES_GLOBALSETTINGSENABLED};
    respawnTemplatesTeamTick[] = {UO_FW_RTEMPLATES_GLOBALSETTINGSENABLED};
    /*respawnTemplatesWave[] = {UO_FW_RTEMPLATES_GLOBALSETTINGSENABLED};
    respawnTemplatesTriggered[] = {UO_FW_RTEMPLATES_GLOBALSETTINGSENABLED};*/
    class UO_FW_RTemplatesS_SafeStart {
        displayName = "Executes SafeStart Module Settings on Respawn";
        UO_FW_RTEMPLATES_GLOBALTYPES;
    };
    class UO_FW_RTemplatesS_CoverMap {
        displayName = "Executes SafeStart Unit Settings on Respawn";
        UO_FW_RTEMPLATES_GLOBALTYPES;
    };
    class UO_FW_RTemplatesS_TeamColour {
        displayName = "Executes TeamColour Unit Settings on Respawn";
        UO_FW_RTEMPLATES_GLOBALTYPES;
    };
    class UO_FW_RTemplatesS_StartInParachute {
        displayName = "Executes StartInParachute Unit Settings on Respawn";
        UO_FW_RTEMPLATES_GLOBALTYPES;
    };
    class UO_FW_RTemplatesS_MapAndCompassRemover {
        displayName = "Executes MapAndCompassRemover Unit Settings on Respawn";
        UO_FW_RTEMPLATES_GLOBALTYPES;
    };
    class UO_FW_RTemplatesS_GearHandle {
        displayName = "Handle Gear Classes for Wave Respawns";
        /*respawnTypes[] = {4};*/
        respawnTypes[] = {};
    };
    class UO_FW_RTemplatesS_TriggerReset {
        displayName = "Reset Trigger Variable after Spawning a Wave/Queue of Players";
        /*respawnTypes[] = {5};*/
        respawnTypes[] = {};
    };
};
