#define COMPONENT MarkerControl
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(UO_FW_Server_MarkerControlModule_Allowed) exitWith {};
if !(missionNamespace getVariable ["UO_FW_MarkerControl_Enabled",false]) exitWith {};

["Marker Control", "Allows the mission maker to create markers visible to a single side and per briefing.", "Olsen, Sacher and PiZZADOX"] call UO_FW_fnc_RegisterModule;
if (!isDedicated) then {
	private _west = missionNamespace getVariable ["UO_FW_MarkerControl_BluforMarkers",[]];
	private _westBriefing = missionNamespace getVariable ["UO_FW_MarkerControl_BluforBriefingMarkers",[]];

	private _east = missionNamespace getVariable ["UO_FW_MarkerControl_OpforMarkers",[]];
	private _eastBriefing = missionNamespace getVariable ["UO_FW_MarkerControl_OpforBriefingMarkers",[]];

	private _indfor = missionNamespace getVariable ["UO_FW_MarkerControl_IndependentMarkers",[]];
	private _indforBriefing = missionNamespace getVariable ["UO_FW_MarkerControl_IndependentBriefingMarkers",[]];

	private _civilian = missionNamespace getVariable ["UO_FW_MarkerControl_CivilianMarkers",[]];
	private _civilianBriefing = missionNamespace getVariable ["UO_FW_MarkerControl_CivilianBriefingMarkers",[]];

	private _system = missionNamespace getVariable ["UO_FW_MarkerControl_SystemMarkers",[]];
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
		LOG_1("markerControl module _markers array: %1",_markers);
	};

	_markers call UO_FW_fnc_ExecuteMarkerControl;

};
