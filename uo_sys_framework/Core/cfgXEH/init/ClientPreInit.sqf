#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

INFO("Client Pre Init");

["UO_FW_RecievePlayerVars", {
	params ["_playerUnit","_varArray"];
	LOG_1("Var Recieve _playerUnit: %1",_playerUnit);
	LOG_1("Var Recieve _varArray: %1",_varArray);
	if !(local _playerUnit) exitwith {};
	{
		_x params ["_propertyName","_value"];
		player setvariable [_propertyName,_value];
	} foreach _varArray;
	["UO_FW_SettingsLoaded", []] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

["CBA_loadingScreenDone", {
	UO_FW_LoadedIntoMission = true;
}] call CBA_fnc_addEventHandler;

["UO_FW_EndMission_Event", {
	_this call UO_FW_fnc_dia_endscreen;
}] call CBA_fnc_addEventHandler;

[{!(isNull player)}, {
	LOG_1("Client call waituntil player: %1",player);
	["UO_FW_RecievePlayerVarRequest", [player,clientOwner]] call CBA_fnc_serverEvent;
}] call CBA_fnc_WaitUntilAndExecute;
