params["_location","_side","_altitude","_altitudeRandom","_steer"];

if(!(_this call UO_FW_fnc_ValidateCapturezone)) exitWith
{
		"Capturezone failed to Validate" call UO_FW_fnc_DebugMessage;
		false
};
["Capturezone", "Runs a capturezone on a marker!", "Sacher"] call UO_FW_FNC_RegisterModule;
if(isServer) then
{
	_this call UO_FW_FNC_Capturezone;
};
