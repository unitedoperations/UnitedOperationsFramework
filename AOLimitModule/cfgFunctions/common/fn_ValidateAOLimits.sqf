private["_markers","_isValid"];
_markers = _this;
_isValid = true;
{
    if(markerType (_x select 1) == "") then
    {
        _isValid = false;
        _temp = format ["AO limit module:<br></br>Warning marker ""%1"" does not exist.", _x]; 
	    _temp call UO_FW_fnc_DebugMessage;
    };
}forEach _markers;
_isValid