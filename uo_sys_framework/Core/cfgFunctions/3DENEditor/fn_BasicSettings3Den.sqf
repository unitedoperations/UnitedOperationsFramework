/*    Description: Main UO Framework Init. Declares needed vars, calls core functions
 *    Arguments:
 *         N/A
 *    Return Value:
 *         N/A
 *    Author
 *        Sacher
 */

#define COMPONENT 3DEN
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EDEN_CHECK;

LOG("BasicSettings3Den called");

"Multiplayer" set3DENMissionAttribute ["respawn",3];
"Multiplayer" set3DENMissionAttribute ["respawndelay",5];
"Multiplayer" set3DENMissionAttribute ["disabledAI",true];
"Multiplayer" set3DENMissionAttribute ["respawnDialog",0];
"Multiplayer" set3DENMissionAttribute ["RespawnButton",1];
"Multiplayer" set3DENMissionAttribute ["respawnTemplates",["Base"]];
"Scenario" set3DENMissionAttribute ["EnableDebugConsole",1];
"Scenario" set3DENMissionAttribute ["enableTargetDebug",1];

if ((EGETMVALUE(Briefing,MissionNotes_Author,"")) isEqualTo "") then {
    QEGVAR(Briefing,MissionNotes) set3DENMissionAttribute [QEGVAR(Briefing,MissionNotes_Author),profileNameSteam];
};

if ((EGETMVALUE(Core,Version_Created,"")) isEqualTo "") then {
    QEGVAR(Core,Version_DummyCategory) set3DENMissionAttribute [QEGVAR(Core,Version_Created),QUOTE(VERSION)];
};

QEGVAR(Core,Version_DummyCategory)  set3DENMissionAttribute [QEGVAR(Core,Version_Updated),QUOTE(VERSION)];
