#include "\x\UO_FW\addons\main\script_macros.hpp"
params["_markerName","_sides","_colors","_intervall","_messages"];
_isValid = true;

if(markerType _markerName == "") then
{
	_isValid = false;
	 UO_FW_DEBUG("Capturezone Error",format ["Capturezone module:<br></br>Warning marker ""%1"" does not exist.", _markerName]);
};
if(_sides isEqualto []) then
{
	UO_FW_DEBUG("Capturezone Error","Capturezone sides are empty!");
	_isValid = false;
};
_isValid
