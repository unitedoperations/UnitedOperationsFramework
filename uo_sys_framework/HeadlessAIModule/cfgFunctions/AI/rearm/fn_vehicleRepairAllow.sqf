if(!hasInterface) exitWith {};
params[["_vehicles",[],[[]]]];
	{
		_x setVariable ['ae_repair_vehicle', true];
	} forEach _vehicles;
	true