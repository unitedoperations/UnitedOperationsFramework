/*	Description: Set the location of a para drop.
 *	Arguments:
 *		NIL
 *	Return Value:
 *		BOOL - True
 */
params [["_u",objNull,[objNull]],["_sign",objNull,[objNull]],["_global",false,[false]]];
	private _markerText = if(_global) then {"ASOR"} else {groupid (group _u)};
    _markerText = format["DZ %1",_markerText];

    private _markerName = [_u,_global, false] call UO_FW_AI_fnc_paraGetMarkerName;
    openmap true; 
    ["paradrop_location", "onMapSingleClick", { 
        _this params ["_markerText", "_markerName"];
        deleteMarker _markerName;
        createMarker [_markerName,_pos];
        _markerName setMarkerText _markerText;
        _markerName setMarkerColor "ColorWEST";
        _markerName setMarkerType  "b_unknown";
        openMap false; 
        ["paradrop_location", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
    },[_markerText, _markerName]] call BIS_fnc_addStackedEventHandler; 
	true