/*	Description: Position Module used to pass positions to other modules and functions.
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
	if(isNil "UO_FW_AI_initialised") then {call UO_AI_fnc_init;};
	switch _mode do {
		case "init": {
			if !is3DEN then {
				_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]]];
				if !(_isActivated) exitWith {};
				sleep 0.25;
				[_logic] spawn UO_AI_fnc_debugSyncedModules;	
			};
		};
		case "attributesChanged3DEN": {
			_logic = _input param [0,objNull,[objNull]];
			private _radiusX = _logic getVariable ["aePositionRadiusX",0];
			private _radiusY = _logic getVariable ["aePositionRadiusY",0];
			set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
		};
		case "registeredToWorld3DEN": {};
		case "unregisteredFromWorld3DEN": {};
		case "connectionChanged3DEN": {};
		default {};
	};
	true