/*	Description: IED Module initialisation checks if modules linked correctly.
 *	Arguments:
 * 		OBJECT	- Module (name, _logic)
 *		ARRAY	- Units (synced to module)
 *		BOOL	- Module Activated
 * 	Return Value:
 * 		BOOL	- True
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
				sleep 0.25;	
				if (UO_FW_AI_DEBUG) then {
					_syncedZoneModule = [_logic,["UO_FW_ZoneModule"]] call UO_AI_fnc_getSyncedModules;
					_type = typeof _logic;
					if (count _syncedZoneModule == 0) then { 
						(format["%1 a %2 has no Zone Modules linked.\nLink a Zone Module to create IED when the Zone is activated.",_logic,_type]) call UO_FW_fnc_DebugMessage;
					};
					[_logic] spawn UO_AI_fnc_debugSyncedModules;
				};
			};
		};
	};
	true