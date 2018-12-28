/*	Description: Template Module saves linked entities for reuse by Position Modules.
 *	Arguments:
 * 		OBJECT	- Module (name, _logic)
 *		ARRAY	- Units (synced to module)
 *		BOOL	- Module Activated
 * 	Return Value:
 * 		BOOL	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)


params [["_mode","",[""]],["_input",[],[[]]]];
switch _mode do {
	case "init": {
		if !is3DEN then {
			_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]],["_grpPosArray",[],[[]]],["_grpPosNew",[],[[]]]];
			if !(_isActivated) exitWith {};
			sleep 0.1;
			if (UO_FW_AI_DEBUG) then {
				[_logic] spawn UO_FW_AI_fnc_debugSyncedModules;
			};
		};
	};
	case "attributesChanged3DEN": {};
	case "registeredToWorld3DEN": {};
	case "unregisteredFromWorld3DEN": {};
	case "connectionChanged3DEN": {};
	default {};
};
true
