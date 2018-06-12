params [["_vehicle", objNull, [objNull]]];
	if (!alive _vehicle) exitWith {false};
	_vehicle setDamage 0;
	_vehicle setVariable ['ae_repair_vehicle', false];
	true