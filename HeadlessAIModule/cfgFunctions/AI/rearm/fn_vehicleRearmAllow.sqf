if(!hasInterface) exitWith {};
params[["_vehicles",[],[[]]]];
	{
		_x setVariable ['ae_rearm_vehicle', true];
	} forEach _vehicles;
	true