params [["_vehicle", objNull, [objNull]]];
	if (!alive _vehicle) exitWith {false};
	_vehicle setVehicleAmmo 1;
	_vehicle setVariable ['ae_rearm_vehicle', false];
	true