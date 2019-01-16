/*	Description: Gets synced units, vehicles and objects to a module.
 *	Arguments:
 *		OBJECT	- Unit
 *		ARRAY	- Units Role and Turret  (assignedVehicleRole) 
 *		OBJECT	- Vehicle
 *	Optional (Vehicle OBJECT not passed can pass position of vehicle and its classname): 
 *		ARRAY	- Position of Vehicle
 * 		STRING	- Vehicle Class Name
 *	Return Value:
 *		TRUE
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
	params [["_u",objNull,[objNull]],["_vr",[],[[]]],["_veh",objNull,[objNull]],["_pos",[],[[]]],["_vc","",[""]]];
	if (isNull _veh) then {	
		_veh = _pos nearestObject _vc;
	};
	_vr params [["_role","",[""]],["_turret",[],[[]]]];
	switch (tolower _role) do {
		case "driver": {
			_u assignAsDriver _veh;
			_u moveInDriver _veh;   
		};
		case "cargo": {
			_u assignAsCargo _veh;
			_u moveInCargo _veh;   
		};
		case "turret": { 
			_u assignAsTurret [_veh,_turret];
			_u moveInTurret [_veh,_turret];
		};
		case "commander": { 
			_u assignAsCommander _veh;
			_u moveInCommander _veh;
		};
		default {};
	};
	true