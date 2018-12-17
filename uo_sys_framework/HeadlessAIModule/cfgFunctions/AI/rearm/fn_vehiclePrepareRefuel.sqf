/*
 * 		OBJECT	- Object to add action too
 *		ARRAY	- Action Parameters
 *		NUMBER	- Distance action visible from
 *		ARRAY	- Position on object
 *		STRING	- Name of Action
 *		NUMBER	- Type of Action (0 for actions, 1 for self-actions)
 *		ARRAY	- Submenu to add action to
 */	
	
	private _vehicles = (getPos player) nearEntities [["Air", "Car", "Motorcycle", "Tank"], 25];
	private _count = count _vehicles;
	[
		(3*_count), 
		[_vehicles, _count], 
		{
			(_this select 0) params [["_vehicles",[],[[]]],["_count",0,[0]]];
			[_vehicles] remoteExec ['UO_FW_AI_fnc_vehicleRefuelAllow',0];
			hint format ["Vehicles(%1) Ready for Refueling",_count]; 
		}, 
		{hint "Preparing Failed!"}, 
		"Preparing Nearby Vehicles for Refueling", 
		{true}, 
		["isnotinside"]
	] call ace_common_fnc_progressBar;
	true