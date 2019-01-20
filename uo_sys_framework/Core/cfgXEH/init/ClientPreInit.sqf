#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

LOG("Client Pre Init");

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

["UO_FW_RegisterModuleEvent", {
	if !(hasInterface) exitwith {};
	params ["_name", "_description", "_author"];
	[{!(isNull player)}, {
		params ["_name", "_description", "_author"];
		if !(player diarySubjectExists "UO_FW_Menu") then {
			player createDiarySubject ["UO_FW_Menu", "UO Framework"];
		};
		if (isNil "UO_FW_ModuleDiaryEntries") then {UO_FW_ModuleDiaryEntries = []};
		if ((UO_FW_ModuleDiaryEntries findIf {_name isEqualto _x}) isEqualto -1) then {
			UO_FW_ModuleDiaryEntries append [_name];
			player createDiaryRecord ["UO_FW_Menu", [_name,"<font size='16'>" + _name + "</font><br/>Description: " + _description + "<br/>by " + _author]];
		};
	},[_name, _description, _author]] call CBA_fnc_WaitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

["UO_FW_RegisterFrameworkEvent", {
	private _info = "
	<font size='18'>United Operations Framework</font><br/>
	The United Operations framework is an addon based utility and function library for making missions.<br/>
	<br/>
	Find out more about the framework on GitHub.<br/>
	github.com/unitedoperations/UnitedOperationsFramework<br/>
	<br/>
	Current Version: 1.0.2
	";
	player createDiaryRecord ["UO_FW_Menu", ["Framework Info", _info]];
}] call CBA_fnc_addEventHandler;

[{!(isNull player)}, {
	LOG_1("Client call waituntil player: %1",player);
	["UO_FW_RecievePlayerVarRequest", [player,clientOwner]] call CBA_fnc_serverEvent;
}] call CBA_fnc_WaitUntilAndExecute;

["UO_FW_EndMission_Event", {
	_this call UO_FW_fnc_dia_endscreen;
}] call CBA_fnc_addEventHandler;
