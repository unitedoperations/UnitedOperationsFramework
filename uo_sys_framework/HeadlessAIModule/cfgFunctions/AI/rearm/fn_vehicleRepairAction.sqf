params [["_target", objNull, [objNull]],["_player", objNull, [objNull]]];
	[
		60*(damage _target), 
		[_target], 
		{
			(_this select 0) params [
				["_target", objNull, [objNull]]
			];
			[_target] remoteExec ['UO_FW_AI_fnc_vehicleRepair',0];
			hint format["%1 Successfully Repaired",(getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName"))]; 
		}, 
		{hint "Repair Failed"}, 
		"Repairing Vehicle", 
		{true}, 
		["isnotinside"]
	] call ace_common_fnc_progressBar;
	true