/*
 * 		OBJECT	- Object to add action too
 *		ARRAY	- Action Parameters
 *		NUMBER	- Distance action visible from
 *		ARRAY	- Position on object
 *		STRING	- Name of Action
 *		NUMBER	- Type of Action (0 for actions, 1 for self-actions)
 *		ARRAY	- Submenu to add action to
 */	
	
	private _vehicles = ((getPos player) nearEntities [["Air", "Car", "Motorcycle", "Tank"], 25]) select {damage _x > 0.1};
	private _count = count _vehicles;
	[
		(3*_count), 
		[_vehicles, _count], 
		{
			(_this select 0) params [["_vehicles",[],[[]]],["_count",0,[0]]];		
			if (_count > 0) then {
				[_vehicles] remoteExec ['UO_AI_fnc_vehicleRepairAllow',0];
				hint format ["Vehicles(%1) Ready for Repairing",_count]; 				
			} else {
				hint"No Vehicles Require Repairs";
			};
		}, 
		{hint "Preparing Failed!"}, 
		"Preparing Damaged Vehicles for Repairs", 
		{true}, 
		["isnotinside"]
	] call ace_common_fnc_progressBar;
	true