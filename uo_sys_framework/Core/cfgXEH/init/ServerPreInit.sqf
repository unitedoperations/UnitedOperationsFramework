#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

LOG("Server Pre Init");

["UO_FW_SettingsLoaded", {
	missionNamespace setVariable ["UO_FW_MissionEnded", false, true];
	missionNamespace setVariable ["UO_FW_ServerInitialized", false, true];
	[] call UO_FW_fnc_teamsInit;
}] call CBA_fnc_addEventHandler;

["UO_FW_RecievePlayerVarRequest", {
	params ["_object","_clientID"];
	LOG_1("Var Request _object: %1",_object);
	LOG_1("Var Request _clientID: %1",_clientID);
	private _allUOVars = (allVariables _object) select {!((toLower(str _x)) find "uo_fw_" isEqualto -1)};
	private _varArray = [];
	{
		private _varstring = _x;
		private _value = _object getVariable _varstring;
		_varArray pushback [_varstring,_value];
	} foreach _allUOVars;
	LOG_1("Var Request Array: %1",_varArray);
	["UO_FW_RecievePlayerVars", [_object,_varArray], _object] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
