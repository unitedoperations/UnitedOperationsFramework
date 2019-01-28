#define COMPONENT MarkerControl
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_SettingsLoaded", {
    if !(UO_FW_Server_MarkerControlModule_Allowed) exitWith {};
    if !(GETMVAR(MarkerControl_Enabled,false)) exitWith {};
    ["UO_FW_RegisterModuleEvent", ["Marker Control", "Allows the mission maker to create markers visible to a single side and per briefing.", "Olsen, Sacher and PiZZADOX"]] call CBA_fnc_localEvent;
    private _markers = [];
    private _markersBriefing = [];
    {
        if !((getMissionLayerEntities _x) isEqualTo []) then {
            if !(((getMissionLayerEntities _x) select 1) isEqualto []) then {
                {_markers pushBack [west, _x];} foreach ((getMissionLayerEntities _x) select 1);
            };
        } else {
            _markers pushBack [west, _x];
        };
    } forEach (GETMVAR(MarkerControl_BluforMarkers,[]));
    {
        if !((getMissionLayerEntities _x) isEqualTo []) then {
            if !(((getMissionLayerEntities _x) select 1) isEqualto []) then {
                {_markersBriefing pushBack [west, _x];} foreach ((getMissionLayerEntities _x) select 1);
            };
        } else {
            _markersBriefing pushBack [west, _x];
        };
    } forEach (GETMVAR(MarkerControl_BluforBriefingMarkers,[]));
    {
        if !((getMissionLayerEntities _x) isEqualTo []) then {
            if !(((getMissionLayerEntities _x) select 1) isEqualto []) then {
                {_markers pushBack [east, _x];} foreach ((getMissionLayerEntities _x) select 1);
            };
        } else {
            _markers pushBack [east, _x];
        };
    } forEach (GETMVAR(MarkerControl_OpforBriefing,[]));
    {
        if !((getMissionLayerEntities _x) isEqualTo []) then {
            if !(((getMissionLayerEntities _x) select 1) isEqualto []) then {
                {_markersBriefing pushBack [east, _x];} foreach ((getMissionLayerEntities _x) select 1);
            };
        } else {
            _markersBriefing pushBack [east, _x];
        };
    } forEach (GETMVAR(MarkerControl_OpforBriefingMarkers,[]));
    {
        if !((getMissionLayerEntities _x) isEqualTo []) then {
            if !(((getMissionLayerEntities _x) select 1) isEqualto []) then {
                {_markers pushBack [independent, _x];} foreach ((getMissionLayerEntities _x) select 1);
            };
        } else {
            _markers pushBack [independent, _x];
        };
    } forEach (GETMVAR(MarkerControl_INDFORBriefing,[]));
    {
        if !((getMissionLayerEntities _x) isEqualTo []) then {
            if !(((getMissionLayerEntities _x) select 1) isEqualto []) then {
                {_markersBriefing pushBack [independent, _x];} foreach ((getMissionLayerEntities _x) select 1);
            };
        } else {
            _markersBriefing pushBack [independent, _x];
        };
    } forEach (GETMVAR(MarkerControl_INDFORBriefingMarkers,[]));
    {
        if !((getMissionLayerEntities _x) isEqualTo []) then {
            if !(((getMissionLayerEntities _x) select 1) isEqualto []) then {
                {_markers pushBack [civilian, _x];} foreach ((getMissionLayerEntities _x) select 1);
            };
        } else {
            _markers pushBack [civilian, _x];
        };
    } forEach (GETMVAR(MarkerControl_CIVBriefing,[]));
    {
        if !((getMissionLayerEntities _x) isEqualTo []) then {
            if !(((getMissionLayerEntities _x) select 1) isEqualto []) then {
                {_markersBriefing pushBack [civilian, _x];} foreach ((getMissionLayerEntities _x) select 1);
            };
        } else {
            _markersBriefing pushBack [civilian, _x];
        };
    } forEach (GETMVAR(MarkerControl_CIVBriefingMarkers,[]));
    {
        if !((getMissionLayerEntities _x) isEqualTo []) then {
            if !(((getMissionLayerEntities _x) select 1) isEqualto []) then {
                {_markers pushBack [sideLogic, _x];} foreach ((getMissionLayerEntities _x) select 1);
            };
        } else {
            _markers pushBack [sideLogic, _x];
        };
    } forEach (GETMVAR(MarkerControl_SystemMarkers,[]));
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
