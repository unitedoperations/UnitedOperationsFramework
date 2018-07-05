params["_location","_side","_altitude","_altitudeRandom","_steer"];

if(!(_this call UO_FW_fnc_ValidateStartInParachute)) exitWith
{
		"Start in Parachute failed to Validate" call UO_FW_fnc_DebugMessage;
		false
};
["Start in Parachute", "Starts players in parachutes", "Sacher"] call UO_FW_FNC_RegisterModule;
if(!isDedicated) then
{
	waitUntil {!isnull player};
	if(side player == _side || _side == sideLogic && player inArea _location) then 
	{
		[player,_altitude,_altitudeRandom,_steer] call UO_FW_fnc_DoParachute;
	};
};
