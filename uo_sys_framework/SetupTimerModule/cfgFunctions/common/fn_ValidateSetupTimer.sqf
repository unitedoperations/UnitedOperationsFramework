params["_selectedSide","_time","_marker","_deleteMarker"];
private _isValid = true;
if (!isMultiplayer) then
{
	_isValid = false;
	"Setup Timer: Singleplayer session detected, this module will function only in multiplayer." call UO_FW_FNC_DebugMessage;
	
};

if (markerType _marker == "") then 
{ 
	_isValid = false;
    _temp = format ["Setup timer module:<br></br>Warning marker ""%1"" does not exist.", _marker]; 
    _temp call UO_FW_FNC_DebugMessage; 
};
if (!UO_FW_SERVER_SETUPMODULE_ALLOWED) then 
{ 
	_isValid = false;
    ["",format ["Setup timer has been disabled by the Server"]] call UO_FW_fnc_DebugMessageDetailed;
};

_isValid