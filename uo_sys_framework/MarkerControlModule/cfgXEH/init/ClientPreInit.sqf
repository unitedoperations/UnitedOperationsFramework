#define COMPONENT MarkerControl
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_SettingsLoaded", {
    if !(UO_FW_Server_MarkerControlModule_Allowed) exitWith {};
    if !(UO_FW_GETMVAR(MarkerControl_Enabled,false)) exitWith {};
    ["UO_FW_RegisterModuleEvent", ["Marker Control", "Allows the mission maker to create markers visible to a single side and per briefing.", "Olsen, Sacher and PiZZADOX"]] call CBA_fnc_globalEvent;
    private _markers = [];
    private _markersBriefing = [];
    {
        if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
            {_markers pushBack [west, _x];} foreach ((getMissionLayerEntities _x) select 1);
        } else {
            _markers pushBack [west, _x];
        };
    } forEach (UO_FW_GETMVAR(MarkerControl_BluforMarkers,[]));
    {
        if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
            {_markersBriefing pushBack [west, _x];} foreach ((getMissionLayerEntities _x) select 1);
        } else {
            _markersBriefing pushBack [west, _x];
        };
    } forEach (UO_FW_GETMVAR(MarkerControl_BluforBriefingMarkers,[]));
    {
        if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
            {_markers pushBack [east, _x];} foreach ((getMissionLayerEntities _x) select 1);
        } else {
            _markers pushBack [east, _x];
        };
    } forEach (UO_FW_GETMVAR(MarkerControl_OpforBriefing,[]));
    {
        if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
            {_markersBriefing pushBack [east, _x];} foreach ((getMissionLayerEntities _x) select 1);
        } else {
            _markersBriefing pushBack [east, _x];
        };
    } forEach (UO_FW_GETMVAR(MarkerControl_OpforBriefingMarkers,[]));
    {
        if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
            {_markers pushBack [independent, _x];} foreach ((getMissionLayerEntities _x) select 1);
        } else {
            _markers pushBack [independent, _x];
        };
    } forEach (UO_FW_GETMVAR(MarkerControl_INDFORBriefing,[]));
    {
        if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
            {_markersBriefing pushBack [independent, _x];} foreach ((getMissionLayerEntities _x) select 1);
        } else {
            _markersBriefing pushBack [independent, _x];
        };
    } forEach (UO_FW_GETMVAR(MarkerControl_INDFORBriefingMarkers,[]));
    {
        if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
            {_markers pushBack [civilian, _x];} foreach ((getMissionLayerEntities _x) select 1);
        } else {
            _markers pushBack [civilian, _x];
        };
    } forEach (UO_FW_GETMVAR(MarkerControl_CIVBriefing,[]));
    {
        if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
            {_markersBriefing pushBack [civilian, _x];} foreach ((getMissionLayerEntities _x) select 1);
        } else {
            _markersBriefing pushBack [civilian, _x];
        };
    } forEach (UO_FW_GETMVAR(MarkerControl_CIVBriefingMarkers,[]));
    {
        if ((count ((getMissionLayerEntities _x) select 1)) > 0) then {
            {_markers pushBack [sideLogic, _x];} foreach ((getMissionLayerEntities _x) select 1);
        } else {
            _markers pushBack [sideLogic, _x];
        };
    } forEach (UO_FW_GETMVAR(MarkerControl_SystemMarkers,[]));
    {
        _x params ["_side","_marker"];
        if !(_side isEqualto (side player)) then {
            _marker setMarkerAlphaLocal 0;
        };
    } forEach _markers;
    {
        _x params ["_side","_marker"];
        if !(_side isEqualto (side player)) then {
            _marker setMarkerAlphaLocal 0;
        };
    } forEach _markersBriefing;
    [{(CBA_missionTime > 0)}, {
        params ["_markersBriefing"];
        {
            _x params ["_side","_marker"];
            _marker setMarkerAlphaLocal 0;
        } forEach _markersBriefing;
    }, [_markersBriefing]] call CBA_fnc_WaitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
