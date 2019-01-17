#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"

if (!(getMissionConfigValue ["UO_FW_Enabled",false])) exitWith {};
if (!UO_FW_Server_Framework_Allowed) exitWith {};

["CBA_loadingScreenDone", {
	UO_FW_LoadedIntoMission = true;
}] call CBA_fnc_addEventHandler;
