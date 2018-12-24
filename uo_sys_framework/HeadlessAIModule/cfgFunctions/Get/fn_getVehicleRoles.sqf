/*	Description: Returns array available roles/positions in a vehicle.
 * 	Arguments:
 * 		OBJECT 	- Vehicle to Check
 *	Optional:
 *		STRING	- Specific Role
 * 	Return Value:
 * 		ARRAY	- Vehicle Roles
 *			ALL ROLES 
 *				[["turret",[[0],[1]]]"commander","driver","cargo","cargo","cargo"];
 *			SELECT ROLES 
 *				["turret",[[0],[1]]]
 *				["driver"]
 *				["cargo","cargo","cargo"]
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)
params["_veh",["_role","",[""]],"_i"];
	
	private _roles = [];
	if (typename _veh != typename "") then {_veh = typeof _veh;};
	private _vehConfig = configfile >> "cfgvehicles" >> _veh;
	switch (_role) do {
		case "gunner";
		case "turret";
		case "turrets": { 
			private _turrets = ["turret",(allTurrets [_this select 0, true])];
			if((count(_turrets select 1)) > 0) then {
				_roles = _turrets; 	 
			};
		};
		case "driver": { 
			private _vehConfig = configfile >> "cfgvehicles" >> _veh;
			_driverIsCommander = getNumber(_vehConfig >> "driverIsCommander");
			if (getNumber(_vehConfig >> "hasDriver") > 0) then {		
				_roles pushBack "driver"
			};
		};		
		case "cargo": { 
			for[{_i = 0}, {_i < getNumber (_vehConfig >> "transportSoldier")}, {_i = _i + 1}] do {
				_roles pushBack "cargo";
			};
		};
		default {
			private _turrets = ["turret",(allTurrets [_this select 0, true])];
			if((count(_turrets select 1)) > 0) then {
				_roles pushBack _turrets; 	 
			};
			_driverIsCommander = getNumber(_vehConfig >> "driverIsCommander");
			if (getNumber(_vehConfig >> "hasDriver") > 0) then {		
				if(_driverIsCommander > 0) then {
					_roles set[(_roles find "commander"),"driver"];
				} else {
					_roles pushBack "driver"
				};
			};
			for[{_i = 0}, {_i < getNumber (_vehConfig >> "transportSoldier")}, {_i = _i + 1}] do {
				_roles pushBack "cargo";
			};
		};
	};	
	_roles