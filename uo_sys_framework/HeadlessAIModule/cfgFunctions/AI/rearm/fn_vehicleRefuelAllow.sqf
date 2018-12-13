if(!hasInterface) exitWith {};
params[["_vehicles",[],[[]]]];
	{
		_x setVariable ['ae_refuel_vehicle', true];
	} forEach _vehicles;
	true