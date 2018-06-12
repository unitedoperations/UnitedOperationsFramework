/*	Description: Creates debug marker at given location.
 * 	Arguments:
 * 		GROUP	- Group Marker Relates To
 * 		ARRAY	- Marker Position
 * 		STRING	- Marker Text
 * 	Optional:
 * 		STRING	- Marker Color
 * 	Return Value:
 * 		BOOL	- True
 *	Author
 *		suits & PiZZADOX
 */		
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params ["_grp",["_pos",[0,0,0],[[]]],["_text","",[""]],["_markerColor","ColorBLUFOR",[""]],["_markerShape","ICON",[""]],["_markerAlpha",1,[0]],["_markerType","b_unknown",[""]]];
	private _count = (leader _grp) getvariable["debugMarker",0];
	private _markerName = format["%1_%2_%3",_grp,_text,_count + 1];
	_markerText = format["%1_%2",_grp,_text];
	_m = createMarker [_markerName,_pos];
	_m setMarkerShape _markerShape;	
	_m setMarkerText _markerText;
	_m setMarkerColor _markerColor;
	_m setMarkerAlpha _markerAlpha;
	_m setMarkerType _markerType;	
	(leader _grp) setvariable["debugMarker",(_count + 1)];
	sleep 60;
	_m setMarkerAlpha (_markerAlpha * 0.5);
	sleep 60;
	_m setMarkerAlpha (_markerAlpha * 0.5);
	sleep 60;
	deleteMarker _m;
	true