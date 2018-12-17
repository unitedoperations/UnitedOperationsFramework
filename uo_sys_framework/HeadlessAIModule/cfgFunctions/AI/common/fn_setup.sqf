/*	Description: Sets up a zone and any units, objects or modules linked to the zone once activated.
 *	Arguments:
 * 		OBJECT	- Zone Module (name, _logic)
 *		NUMBER	- Zone Activation Delay
 *		STRING	- Code as String to Execute on Activation
 *		BOOL	- Initial/PreInit Spawn
 * 	Return Value:
 * 		BOOL	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)

params ["_logic",["_delay",0,[0]],["_code",{},[{}]],["_availableEvents",{},[{}]],["_initial",false]];
if ((_initial) && (_logic getvariable ["initiallyspawned",false])) exitwith {};
if ((tolower(typeOf _logic)) IN ["UO_FW_AI_ControlModule", "UO_FW_AI_ControlModule_R"]) then {
	[_logic] spawn {
		params ["_logic"];
		switch (_logic getVariable ["aeControlAction",0]) do {
			case 0 : {
				// Enable Linked Zones
				[([_logic,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call UO_FW_AI_fnc_getSyncedModules),0] call UO_FW_AI_fnc_setZone;
			};
			case 1 : {
				// Disable Linked Zones
				[([_logic,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call UO_FW_AI_fnc_getSyncedModules),1] call UO_FW_AI_fnc_setZone;
			};
			case 2 : {
				// Toggle Linked Zones
				[([_logic,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call UO_FW_AI_fnc_getSyncedModules),2] call UO_FW_AI_fnc_setZone;
			};
		};
	};
};

//TODO
//private _syncedFunctions = [_logic,UO_FW_functions] call UO_FW_AI_fnc_getSyncedModules;
//if (count _syncedFunctions > 0) then {
//	[_syncedFunctions,_delay] spawn UO_FW_AI_fnc_createFunctions;
//};

private _entities = (([_logic,UO_FW_entities] call UO_FW_AI_fnc_getDetails) select 1);
if (count _entities > 0) then {
	_isHC = _logic getVariable ['aeHeadless',true];
	if ((!isMultiplayer) || ((count UO_FW_var_HCs) < 1) || (!_isHC)) then {
		if (_initial) then {
			[_logic,_entities,_code] call UO_FW_AI_fnc_createZoneInit;
			_logic setvariable ["initiallyspawned",true];
		} else {
			[_logic,_entities,_delay,_code] call UO_FW_AI_fnc_createZone;
		};
	} else {
		if (_initial) then {
			[[_logic,_entities,_code], {if (!UO_FW_var_isHC) exitWith {}; [_this] call UO_FW_AI_fnc_createZoneInit;}] remoteExec ["call", HC_ID];
			_logic setvariable ["initiallyspawned",true];
		} else {
			[[_logic,_entities,_delay,_code], {if (!UO_FW_var_isHC) exitWith {}; [_this] call UO_FW_AI_fnc_createZone;}] remoteExec ["call", HC_ID];
		};
	};
};

private _posModules = [_logic,["UO_FW_AI_PositionModule"]] call UO_FW_AI_fnc_getSyncedModules;
for [{_p=0}, {(_p < count _posModules)}, {_p = _p + 1}] do {
	private _tempModules = [(_posModules select _p),["UO_FW_AI_TemplateModule"]] call UO_FW_AI_fnc_getSyncedModules;
	for [{_t=0}, {(_t < count _tempModules)}, {_t = _t + 1}] do {
		[(_tempModules select _t),((_tempModules select _t) getVariable "aeTemplate"),_delay,{}] spawn UO_FW_AI_fnc_createZone;
	};
};

{
	_x  spawn UO_FW_AI_fnc_setRespawn;
	diag_log format["zone setup | %1",_x];
} forEach ([_logic,["UO_FW_AI_RespawnModule"]] call UO_FW_AI_fnc_getSyncedModules);

if (UO_FW_AI_DEBUG) then {
	private _logicType = typeof _logic;
	_entities params [["_grps",[],[[]]],["_emptyvehs",[],[[]]],["_objs",[],[[]]]];
	"Zone Activated" call UO_FW_fnc_DebugMessage;
};
true
