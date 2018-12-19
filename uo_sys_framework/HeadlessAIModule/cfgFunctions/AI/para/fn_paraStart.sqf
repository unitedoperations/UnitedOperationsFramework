/*	Description: Performs the para drop of vehicle and crew.
 *	Arguments:
 *		OBJECT	- Unit
 *		BOOL	- Vehicle Smoke ON/OFF
 *	Return Value:
 *		TRUE
 */

	//[_sign,["Set SQUAD Drop Zone",{[player] spawn UO_FW_AI_fnc_setParaLocation},[]],2,[.2,0,0.3]] spawn UO_FW_AI_fnc_globalddAction;
	//[_sign,["Set ALL Drop Zone",{[player] spawn UO_FW_AI_fnc_setParaLocationAll},[]],2,[.2,0,0.35]] spawn UO_FW_AI_fnc_globalddAction;
	//[_sign,["Initiate SQUAD Para Insertion",{[player] spawn UO_FW_AI_fnc_paraStart},[]],2,[-.2,0,0.4]] spawn UO_FW_AI_fnc_globalddAction;
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
	params [["_u",objNull,[objNull]],["_s",objNull,[objNull]],["_global",false,[false]],["_currentRow",0,[0]],["_currentColumn",0,[0]],["_clients",[],[[]]],["_ldrs",[],[[]]],["_vehPos",[],[[]]]];

	private _dropHeight = _s getVariable["aeDropHeight",3000];
	private _paraSmoke = _s getVariable["aeParaSmoke",false];

	private _units = if(_global) then { (_u nearEntities [["Man"],30]) } else {units (group _u)};
	private _posMarker = [_u, _global, false] call UO_FW_AI_fnc_paraGetMarkerName;
	private _dirMarker = [_u, _global, true] call UO_FW_AI_fnc_paraGetMarkerName;

	private _dropDir = (markerDir _dirMarker);
	private _dropZone = markerPos _posMarker;
	_dropZone set [2, _dropHeight];
	private _planePos = _dropZone getPos [((count _vehs)*50), _dropDir];
	_planePos set [2, _dropHeight];

	{
		if (_paraSmoke) then {_ldrs pushBackUnique (leader (group (vehicle _x)));};
		_clients pushBackUnique owner _x;
	} forEach _units;
	private _vehs = _units select {(vehicle _x) != _x } apply { moveOut _x; vehicle _x };
	_vehs = _vehs arrayIntersect _vehs;
	sleep 5;
	{
		moveOut _x;
		private _upos = (([[-floor(2*0.5*20),0,0],_dropDir] call BIS_fnc_rotateVector2D) vectorAdd _dropZone) vectorAdd
		(([[20,0,0],_dropDir] call BIS_fnc_rotateVector2D) vectorMultiply _currentColumn) vectorAdd
		(([[0,30,0],_dropDir] call BIS_fnc_rotateVector2D) vectorMultiply _currentRow);
		removeBackpackGlobal _x;
		_x addBackpackGlobal "B_Parachute";
		_x setDir _dropDir;
		_x setPosATL _upos;
		_currentRow = _currentRow + 1;
		if(_currentRow > (((count _units) * 0.5)+1)) then {
			_currentRow = 0;
			_currentColumn = _currentColumn + 1;
		};
	} forEach _units;
	sleep 1;
	for [{_i=0},{(_i < (count _vehs))},{_i=_i+1}] do {
		private _vehPos = _dropZone getPos [((_i+1)*50), _dropDir];
		_vehPos set [2, _dropHeight];
		private _v = _vehs select _i;
		_v setPosATL _vehPos;
		[_v,false,_paraSmoke] spawn UO_FW_AI_fnc_paraVehicle;
	};

//	[(_units select 0), _planePos,_dropDir,"RHS_C130J"] spawn UO_FW_AI_fnc_paraCreateAircraft;
	if (_paraSmoke) then {
		{
			[_x] spawn {
				params["_l"];
				waitUntil {sleep 1; (((getPosASLW _l) select 2) < 20 || !alive _l); };
				if(alive _l) then {
					private _pos = getPosASLW _l;
					private _s1 = "SmokeShell" createVehicle (_pos vectorAdd [15,15,-5]);
				};
			};
		} forEach _ldrs;
	};
	true
