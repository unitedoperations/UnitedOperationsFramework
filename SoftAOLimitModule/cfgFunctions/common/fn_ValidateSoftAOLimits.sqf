#include "\x\UO_FW\addons\main\script_macros.hpp"
_markers = _this;
_isValid = true;
{
    if(markerType (_x select 1) == "") then
    {
        _isValid = false;
        UO_FW_DEBUG("Soft AO Limit Error",format ["Soft AO limit module:<br></br>Warning marker ""%1"" does not exist.", _x]);
    };
}forEach _markers;
_isValid