/*  Description: Performs a para drop of object.
 *  Arguments:
 *      NUMBER  - Amount of Items to Drop
 *      ANY     - OBJECT, MARKER, LOCATION, GROUP, POSITION to determine drop location
 *  Optional:
 *      BOOL    - Deply smoke on item reaching ground
 *      ANY     - OBJECT, MARKER, LOCATION, GROUP, POSITION to determine start/spawn location, closest edge of map if empty array
 *  Return Value:
 *      TRUE
 * [3,"drop"] spawn UO_AI_fnc_createAirResupply;
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)

params [["_ordnanceType",1,[0]]];    
openmap true;
["ammodrop_location", "onMapSingleClick", {
	[_this select 1,_this select 4,_this select 5] spawn {
		params [["_pos",[0,0,0],[[]]],["_ordnanceType",1,[0]],["_markerName","aeAmmoDropMarker",[""]],["_ordnance","",[""]]];
		deleteMarker _markerName;
		createMarker [_markerName,_pos];
		_markerName setMarkerText "AD";
		_markerName setMarkerColor "ColorWEST";
		_markerName setMarkerType  "b_unknown";	
		private _factionPlayer = faction player;
		private _ammoCrate = format ["%1_ammo_air", _factionPlayer];
		private _medicalCrate = format ["%1_ammo_med_air", _factionPlayer];
		private _spos = (getMarkerPos "spawnptQRF") getPos [2000, ((getPos player) getDir (getMarkerPos "spawnptQRF"))];
		_ordnance = switch (_ordnanceType) do {
			case 1: {[_ammoCrate];};
			case 2: {[_ammoCrate,_ammoCrate];};
			case 3: {[_ammoCrate,_ammoCrate,_ammoCrate];};
			case 4: {[_medicalCrate];};
			case 5: {[_medicalCrate,_medicalCrate];};
			case 6: {[_ammoCrate,_medicalCrate];};
			case 7: {[_ammoCrate,_ammoCrate,_medicalCrate];};
			default {[_ammoCrate];};
		};
		_spos = _spos vectorAdd [0,0,300];   
		_dpos = (([_pos,0,50,1] call UO_AI_fnc_getRandomPositionCircle) select 0);
		_dpos = _dpos vectorAdd [0,0,150];				
		_wait = (floor random [20,70,150]);
		[_dpos,_spos,_ordnance,_wait] remoteExec ["UO_AI_fnc_createAmmoDrop",[0,2] select isMultiplayer];
		sleep 0.5;
		hint format["Resupply Request Received ETA: %1%2",ceil(_wait/60),if(ceil(_wait/60) > 1)then{"minutes"}else{"minute"}];
		openMap false;
		["ammodrop_location", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	};
},[_ordnanceType]] call BIS_fnc_addStackedEventHandler;
true