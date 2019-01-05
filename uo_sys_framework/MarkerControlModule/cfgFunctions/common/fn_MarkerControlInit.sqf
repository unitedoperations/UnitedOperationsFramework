#include "\x\UO_FW\addons\main\script_macros.hpp"

_isEnabled = missionNamespace getVariable ["UO_FW_MarkerControl_Enabled",false];
if(!_isEnabled) exitWith {};
["Marker Control", "Change visibility of markers", "Sacher and PiZZADOX"] call UO_FW_FNC_RegisterModule;
if (!isDedicated) then
{
	_west = missionNamespace getVariable ["UO_FW_MarkerControl_BluforMarkers",[]];
	_westBriefing = missionNamespace getVariable ["UO_FW_MarkerControl_BluforBriefingMarkers",[]];

	_east = missionNamespace getVariable ["UO_FW_MarkerControl_OpforMarkers",[]];
	_eastBriefing = missionNamespace getVariable ["UO_FW_MarkerControl_OpforBriefingMarkers",[]];

	_indfor = missionNamespace getVariable ["UO_FW_MarkerControl_IndependentMarkers",[]];
	_indforBriefing = missionNamespace getVariable ["UO_FW_MarkerControl_IndependentBriefingMarkers",[]];

	_civilian = missionNamespace getVariable ["UO_FW_MarkerControl_CivilianMarkers",[]];
	_civilianBriefing = missionNamespace getVariable ["UO_FW_MarkerControl_CivilianBriefingMarkers",[]];

	_system = missionNamespace getVariable ["UO_FW_MarkerControl_SystemMarkers",[]];
	private ["_markers"];

	_markers = [];

	{
		if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
			{_markers pushBack [west, _x, false];} foreach ((getMissionLayerEntities _x) select 1);
		} else {
			_markers pushBack [west, _x, false];
		};
	} forEach _west;
	{
		if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
			{_markers pushBack [west, _x, true];} foreach ((getMissionLayerEntities _x) select 1);
		} else {
				_markers pushBack [west, _x, true];
		};
	} forEach _westBriefing;

	{
		if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
			{_markers pushBack [east, _x, false];} foreach ((getMissionLayerEntities _x) select 1);
		} else {
			_markers pushBack [east, _x, false];
		};
	} forEach _east;
	{
		if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
			{_markers pushBack [east, _x, true];} foreach ((getMissionLayerEntities _x) select 1);
		} else {
				_markers pushBack [east, _x, true];
		};
	} forEach _eastBriefing;

	{
		if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
			{_markers pushBack [resistance, _x, false];} foreach ((getMissionLayerEntities _x) select 1);
		} else {
			_markers pushBack [resistance, _x, false];
		};
	} forEach _indfor;
	{
		if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
			{_markers pushBack [resistance, _x, true];} foreach ((getMissionLayerEntities _x) select 1);
		} else {
				_markers pushBack [resistance, _x, true];
		};
	} forEach _indforBriefing;

	{
		if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
			{_markers pushBack [civilian, _x, false];} foreach ((getMissionLayerEntities _x) select 1);
		} else {
			_markers pushBack [civilian, _x, false];
		};
	} forEach _civilian;
	{
		if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
			{_markers pushBack [civilian, _x, true];} foreach ((getMissionLayerEntities _x) select 1);
		} else {
				_markers pushBack [civilian, _x, true];
		};
	} forEach _civilianBriefing;

	{
		if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
			{_markers pushBack [sideLogic, _x, true];} foreach ((getMissionLayerEntities _x) select 1);
		} else {
			_markers pushBack [sideLogic, _x, true];
		};
	} forEach _system;

	if (UO_FW_Debug_Detailed_Enabled) then {
		private _msg = format ["markerControl module _markers array: %1",_markers];
		UO_FW_DEBUG("",_msg);
	};

	_markers call UO_FW_fnc_ExecuteMarkerControl;

};
