#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL)
_isEnabled = missionNamespace getVariable ["UO_FW_MarkerControl_Enabled",false];
if(!_isEnabled) exitWith {};
if (!isDedicated) then
{
	_west = missionNamespace getVariable ["UO_FW_MarkerControl_BluforMarkers",[]];
	_westBriefing =missionNamespace getVariable ["UO_FW_MarkerControl_BluforBriefingMarkers",[]];

	_east =missionNamespace getVariable ["UO_FW_MarkerControl_OpforMarkers",[]];
	_eastBriefing =missionNamespace getVariable ["UO_FW_MarkerControl_OpforBriefingMarkers",[]];

	_indfor =missionNamespace getVariable ["UO_FW_MarkerControl_IndependentMarkers",[]];
	_indforBriefing =missionNamespace getVariable ["UO_FW_MarkerControl_IndependentBriefingMarkers",[]];

	_civilian =missionNamespace getVariable ["UO_FW_MarkerControl_CivilianMarkers",[]];
	_civilianBriefing =missionNamespace getVariable ["UO_FW_MarkerControl_CivilianBriefingMarkers",[]];

	_noone =missionNamespace getVariable ["UO_FW_MarkerControl_NooneMarkers",[]];
	private ["_markers"];

	_markers = [];

	{
		_markers pushBack [west, _x, false];
	}forEach _west;
	{
		_markers pushBack [west, _x, true];
	}forEach _westBriefing;
	{
			_markers pushBack [east,_x,false];
	}forEach _east;
	{
			_markers pushBack [east,_x,true];
	}forEach _eastBriefing;
	{
			_markers pushBack [resistance,_x,false];
	}forEach _indfor;
	{
			_markers pushBack [resistance,_x,true];
	}forEach _indforBriefing;
	{
			_markers pushBack [civilian,_x,false];
	}forEach _civilian;
	{
			_markers pushBack [civilian,_x,true];
	}forEach _civilianBriefing;
	{
			_markers pushBack [sideLogic,_x,true];
	}forEach _noone;
	_markers call UO_FW_fnc_ExecuteMarkerControl;


};
