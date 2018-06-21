/*	Description: Module initialisation checks if modules linked correctly.
 *	Arguments:
 * 		STRING	- Mode of Module
 *		ARRAY	- Inputs
 * 	Return Value:
 * 		BOOL	- True
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params [["_mode","",[""]],["_input",[],[[]]]];
	if(isNil "UO_FW_AI_initialised") then {call UO_FW_fnc_init;};
	switch _mode do {
		case "init": {
			if !is3DEN then {
				_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]]];
				if !(_isActivated) exitWith {};
				sleep 0.25;	
				if (UO_FW_AI_DEBUG) then {
					_syncedZoneModule = [_logic,["UO_FW_ZoneModule"]] call UO_FW_fnc_getSyncedModules;
					_type = typeof _logic;
					if (count _syncedZoneModule == 0) then { 
						(format["%1 a %2 has no Zone Modules linked.\nLink a Zone Module to create a Fast Air Strike when the Zone is activated.",_logic,_type]) call UO_FW_fnc_DebugMessage; 
					};
					[_logic] spawn UO_FW_fnc_debugSyncedModules;
				};
			};
		};
		case "attributesChanged3DEN": {
			_logic = _input param [0,objNull,[objNull]]; 
			private _radius = (_logic getVariable ["aeADRadius",0]);
            private _area = _logic get3DENAttribute "size2";
            set3DENAttributes [[[_logic],"size2",[_radius,_radius]]];
		};
		case "registeredToWorld3DEN": {};
		case "unregisteredFromWorld3DEN": {};
		case "connectionChanged3DEN": {};
		default {};
	};
	true