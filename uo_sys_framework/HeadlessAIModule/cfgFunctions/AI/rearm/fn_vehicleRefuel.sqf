params [["_vehicle", objNull, [objNull]]];
diag_log format["RETURN vehRefuel | %1",_this];
	if (!alive _vehicle) exitWith {false};
	_vehicle setFuel 1;
	_vehicle setVariable ['ae_refuel_vehicle', false];
	true