/*	Description: Set the approach direction of the para drop aircraft.
 *	Arguments:
 *		OBJECT	- UNIT
 *	Return Value:
 *		BOOL 	- True
 */
	params [["_u",objNull,[objNull]],["_sign",objNull,[objNull]],["_global",false,[false]]];
	openmap true; 
	private _posMarkerName = [_u, _global, false] call UO_FW_AI_fnc_paraGetMarkerName;
	private _dirMarkerName = [_u, _global, true] call UO_FW_AI_fnc_paraGetMarkerName;
	["paradrop_location", "onMapSingleClick", { 
		params ["_posMarkerName", "_dirMarkerName"];
		private _dzPos = markerPos _posMarkerName;
		if((_dzPos) isEqualTo [0,0,0]) exitWith {hint "Drop Zone Not Set\nSet Drop Zone First"};
		private _dir = _pos getDir _dzPos;
		deleteMarker _dirMarkerName;
		createMarker [_dirMarkerName,_pos];
		_dirMarkerName setMarkerShape "ICON";
		_dirMarkerName setMarkerType "mil_arrow2";
		_dirMarkerName setMarkerColor "ColorWEST";
		_dirMarkerName setMarkerAlpha 0.3;
		_dirMarkerName setMarkerDir _dir;
		openMap false; 
		["paradrop_location", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	},[_posMarkerName, _dirMarkerName]] call BIS_fnc_addStackedEventHandler;
	true