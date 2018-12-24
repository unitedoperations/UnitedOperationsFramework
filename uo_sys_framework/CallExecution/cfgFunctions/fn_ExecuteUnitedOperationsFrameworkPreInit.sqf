#include "\x\UO_FW\addons\main\script_macros.hpp"

if(!(getMissionConfigValue  ["UO_FW_Enabled",false])) exitWith {};
if(!UO_FW_SERVER_FRAMEWORK_ALLOWED) exitWith {};
UO_FW_Framework_Initialized = false;
//[] call UO_FW_FNC_setDefaults;
if (isServer) then {
	UO_FW_Teams = []; //DO NOT REMOVE
	UO_FW_MissionEnded = false; //Mission has not ended
	[] call UO_FW_fnc_teamsInit;
};
