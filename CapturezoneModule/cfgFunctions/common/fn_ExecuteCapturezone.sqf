params["_location","_side","_altitude","_altitudeRandom","_steer"];

if(!(_this call UO_FW_fnc_ValidateCapturezone)) exitWith
{
		"Capturezone failed to Validate" call UO_FW_fnc_DebugMessage;
		false
};

if(isServer) then
{
	_this call UO_FW_FNC_Capturezone;
};
true
