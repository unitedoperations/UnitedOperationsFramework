/*	Description: Module initialisation checks if modules linked correctly.
 *	Arguments:
 * 		STRING	- Mode of Module
 *		ARRAY	- Inputs
 * 	Return Value:
 * 		BOOL	- True
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)

params [["_mode","",[""]],["_input",[],[[]]]];
	if(isNil "UO_FW_AI_initialised") then {call UO_FW_AI_fnc_init;};
	switch _mode do {
		case "init": {
			if !is3DEN then {
				_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]]];
				if !(_isActivated) exitWith {};
				sleep 0.25;
				_syncedZoneModule = [_logic,["UO_FW_AI_ZoneModule"]] call UO_FW_AI_fnc_getSyncedModules;
				_type = typeof _logic;
				if (count _syncedZoneModule == 0) then {
					_msg = format["%1 a %2 has no Zone Modules linked.",_logic,_type];
					UO_FW_DEBUG("",_msg)
				};
				[_logic] spawn UO_FW_AI_fnc_debugSyncedModules;
			};
		};
		case "attributesChanged3DEN": {};
		case "registeredToWorld3DEN": {};
		case "unregisteredFromWorld3DEN": {};
		case "connectionChanged3DEN": {};
		default {};
	};
	true
