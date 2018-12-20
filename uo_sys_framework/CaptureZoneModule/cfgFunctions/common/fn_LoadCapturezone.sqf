#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER)

params ["_logic"];
if (isServer) then
{

	_loc = getPosATL _logic;
	_radiusX = _logic getVariable ["UO_FW_CaptureZone_RadiusX",100];
	_radiusY = _logic getVariable ["UO_FW_CaptureZone_RadiusY",100];
	_direction = getdir _logic;
	_isRectangle = if((typeof _logic) isEqualTo "UO_FW_CaptureZoneModule_R") then {true} else {false};
	_area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];
	_bluforWin = _logic getVariable ["UO_FW_CaptureZone_BluforWin",0];
	_opforWin = _logic getVariable ["UO_FW_CaptureZone_OpforWin",0];
	_independentWin = _logic getVariable ["UO_FW_CaptureZone_IndependentWin",0];
	_civilianWin = _logic getVariable ["UO_FW_CaptureZone_OpforWin",0];
	_messages = [];
	_messages pushBack (_logic getVariable ["UO_FW_CaptureZone_BluforMessage",""]);
	_messages pushBack (_logic getVariable ["UO_FW_CaptureZone_OpforMessage",""]);
	_messages pushBack (_logic getVariable ["UO_FW_CaptureZone_IndependentMessage",""]);
	_messages pushBack (_logic getVariable ["UO_FW_CaptureZone_CivilianMessage",""]);
	_messages pushBack (_logic getVariable ["UO_FW_CaptureZone_ContestedMessage",""]);
	_messages pushBack (_logic getVariable ["UO_FW_CaptureZone_UncontestedMessage",""]);
	_variablename = _logic getVariable ["UO_FW_CaptureZone_VariableName",""];
	_hidden = _logic getVariable ["UO_FW_CaptureZone_Hidden",false];
	_sides = [];
	if(_bluforWin > 0) then
	{
		_sides pushBack [west,_bluforWin];
	};
	if(_opforWin > 0) then
	{
		_sides pushBack [east,_opforWin];
	};
	if(_independentWin > 0) then
	{
		_sides pushBack [independent,_independentWin];
	};
	if(_civilianWin > 0) then
	{
		_sides pushBack [civilian,_civilianWin];
	};
	_colors = ["ColorBlue","ColorRed","ColorGreen","ColorYellow","ColorWhite","ColorKhaki"];
	_interval = _logic getVariable ["UO_FW_CaptureZone_SleepInterval",15];
	[_area,_sides,_colors,_interval,_messages,_variablename,_hidden] call UO_FW_FNC_ExecuteCaptureZone;
};
