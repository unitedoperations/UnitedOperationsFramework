/*	Description: IED module setup.
 *	Arguments:
 * 		OBJECT	- IED (Module) / _logic
 * 	Return Value:
 *		BOOL 	- true
 * 	Author: 
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
				_syncedIEDModule = [_logic,["UO_FW_IEDModule"]] call UO_AI_fnc_getSyncedModules;
				_type = typeof _logic;
				if (count _syncedIEDModule == 0) then { 
					_msg = format["%1 a %2 has no IED Module linked.\nLink a IED Module to create the IED Pressure Plate when the Zone is activated.",_logic,_type];
					UO_FW_DEBUG("",_msg)
				};
				[_logic] spawn UO_AI_fnc_debugSyncedModules;		
			};
		};
	};
	true