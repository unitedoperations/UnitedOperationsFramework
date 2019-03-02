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
UO_FW_EXEC_CHECK(ALL);
UO_FW_3DEN_CHECK;

"Multiplayer" set3DENMissionAttribute ["respawn",3];
"Multiplayer" set3DENMissionAttribute ["respawndelay",5];
"Multiplayer" set3DENMissionAttribute ["disabledAI",true];
"Multiplayer" set3DENMissionAttribute ["respawnDialog",0];
"Multiplayer" set3DENMissionAttribute ["RespawnButton",1];
"Multiplayer" set3DENMissionAttribute ["respawnTemplates",["Base"]];
"Scenario" set3DENMissionAttribute ["EnableDebugConsole",1];
"Scenario" set3DENMissionAttribute ["enableTargetDebug",1];

if ((EGETMVALUE(Briefing,MissionNotes_Author,"")) isEqualTo "") then {
    "UO_FW_Mission_Notes" set3DENMissionAttribute ["UO_FW_Briefing_MissionNotes_Author",profileNameSteam];
};

if ((EGETMVALUE(Core,Version_Created,"")) isEqualTo "") then {
    "UO_FW_Core_Version_DummyCategory" set3DENMissionAttribute ["UO_FW_Core_Version_Created",QUOTE(VERSION)];
};

"UO_FW_Core_Version_DummyCategory" set3DENMissionAttribute ["UO_FW_Core_Version_Updated",QUOTE(VERSION)];
