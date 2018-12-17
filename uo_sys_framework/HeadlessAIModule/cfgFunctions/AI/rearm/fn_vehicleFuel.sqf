params [["_target", objNull, [objNull]],["_player", objNull, [objNull]]];
	[
		60*(fuel _target), 
		[_target], 
		{
			(_this select 0) params [
				["_target", objNull, [objNull]]
			];
			[_target] remoteExec ['UO_FW_AI_fnc_vehicleRefuel',0];
			hint format["%1 Fully Refueled",(getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName"))]; 
		}, 
		{hint "Refuel Failed"}, 
		"Refueling Vehicle", 
		{true}, 
		["isnotinside"]
	] call ace_common_fnc_progressBar;
	true