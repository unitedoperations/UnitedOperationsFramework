#include "x\UO_FW\addons\main\FiremissionModule\Global\defs.hpp"
private _marker = "";
{
	if((markerText (_x))  == _this) then
	{
		_marker = _x;
	};
}forEach allMapMarkers;
_marker;
