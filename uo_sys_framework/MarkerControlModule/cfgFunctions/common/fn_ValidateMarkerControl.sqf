#define COMPONENT MarkerControl
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

private ["_markers","_isValid"];
_markers = _this;
_isValid = true;
{
	if(markerType (_x select 1) isEqualto "") then
	{
		ERROR_1("Marker control module:<br></br>Warning marker ""%1"" does not exist.", (_x select 1));
		_isValid = false;
	};
}forEach _markers;
_isValid
