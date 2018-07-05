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
switch _mode do {
	case "init": {
		if !is3DEN then {
			if(isNil "UO_FW_AI_initialised") then {call UO_AI_fnc_init;};
			_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]],"_s"];
			if !(_isActivated) exitWith {};
			sleep 0.25;	
			private _entities = [_logic] call UO_AI_fnc_getSyncedObjects;
			_logic setVariable ["aeArtGuns",_entities];
			_syncedZoneModule = [_logic,["UO_FW_ZoneModule"]] call UO_AI_fnc_getSyncedModules;
			_type = typeof _logic;
			if (count _syncedZoneModule == 0) then {
				_msg = format["%1 a %2 has no Zone Modules linked.\nLink a Zone Module to create a Artillery Strike when the Zone is activated.",_logic,_type];
				UO_FW_DEBUG("",_msg)
				[_logic] spawn UO_AI_fnc_debugSyncedModules;
			};
		};
	};
	case "attributesChanged3DEN": {
		_logic = _input param [0,objNull,[objNull]]; 
		private _radius = (_logic getVariable ["aeARTRadius",300]);
        private _area = _logic get3DENAttribute "size2";
        set3DENAttributes [[[_logic],"size2",[_radius,_radius]]];
	};
	case "registeredToWorld3DEN": {};
	case "unregisteredFromWorld3DEN": {};
	case "connectionChanged3DEN": {};
	default {};
};
true