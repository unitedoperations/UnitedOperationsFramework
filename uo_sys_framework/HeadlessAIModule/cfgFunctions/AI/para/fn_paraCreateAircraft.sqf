/*	Description: Create the aircraft to para drop out of.
 *	Arguments:
 *		OBJECT	- First Unit
 *		ARRAY	- Last Vehicle Position
 *		NUMBER	- Direction of Drop
 *		STRING	- Type of Aircraft to drop from
 *	Return Value:
 *		BOOL - True
 */
params [["_u",objNull,[objNull]],["_vehPos",[],[[]]],["_dropDir",0,[0]],["_aircraft","RHS_C130J",[""]],["_spos",[],[[]]]];
	if(count _vehPos isEqualTo 0 ) then {
		_spos = (getPosASLW _u) getPos [30, _dropDir];
	};
	_spos = _spos vectorAdd [0,0,30];
	_epos = _spos getPos [1000, ((_dropDir + 180) % 360)];
	private _b = createVehicle [_aircraft, _spos, [], 0, "FLY"];		
	_b setPosASLW _spos;
	_b setDir _dropDir;
	createVehicleCrew _b;
	_crew = (crew _b);
	_b setVelocity [((velocity _b) select 0) + (sin _dropDir * 120),((velocity _b) select 1) + (cos _dropDir * 120),((velocity _b) select 2)];  
	_b flyInHeight ((_spos select 2)*0.5);
	_grp = (group (driver _b));
	[_grp,_epos,0,0,"CARELESS","RED","FULL","WEDGE","MOVE","{deleteVehicle (vehicle _x); deleteVehicle _x;} forEach thisList;",300] call UO_AI_fnc_createWaypoint;
	true