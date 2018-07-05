params [["_target", objNull, [objNull]],["_player", objNull, [objNull]]];
	[
		10*(random [0,5,10]), 
		[_target], 
		{
			(_this select 0) params [
				["_target", objNull, [objNull]]
			];
			[_target] remoteExec ['UO_AI_fnc_vehicleRearm',0];
			hint format["%1 Successfully Rearmed",(getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName"))]; 
		}, 
		{hint "Rearm Failed"}, 
		"Rearming Vehicle", 
		{true}, 
		["isnotinside"]
	] call ace_common_fnc_progressBar;
	true