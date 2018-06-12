/*	Description: Non-Combatant module initialisation creates the zone.
 *	Arguments:
 * 		OBJECT	- Module (name, _logic)
 *		ARRAY	- Units (synced to module)
 *		BOOL	- Module Activated
 * 	Return Value:
 * 		BOOL	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params [["_mode","",[""]],["_input",[],[[]]]];
	if(isNil {UO_FW_AI_initialised}) then {call UO_AI_fnc_init;};
	switch _mode do {
		case "init": {
			if !is3DEN then {
				_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]]];
				if !(_isActivated) exitWith {};
				missionNamespace setVariable ["UO_FW_NonCombatantModule", _logic, true];
				if (UO_FW_AI_DEBUG) then {
					[_logic] spawn UO_AI_fnc_debugSyncedModules;	
				};
			};
		};
		case "attributesChanged3DEN": {};
		case "registeredToWorld3DEN": {};
		case "unregisteredFromWorld3DEN": {};
		case "connectionChanged3DEN": {};
	};
	true