#include "\x\UO_FW\addons\main\script_macros.hpp"
private ["_markers","_isValid"];
_markers = _this;
_isValid = true;
{
	if(markerType (_x select 1) == "") then
	{
		private _temp = format ["Marker control module:<br></br>Warning marker ""%1"" does not exist.", (_x select 1)]; \
    	_temp call UO_FW_FNC_DebugMessage;
		_isValid = false;
	};
}forEach _markers;
_isValid
