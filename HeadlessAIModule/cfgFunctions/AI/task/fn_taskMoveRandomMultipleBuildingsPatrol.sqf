/*	Description: Task a group to move to multiple buildings and patrol with in them.
 * 	Arguments:
 *		ARRAY	- Buildings to Use
 * 		GROUP	- Group
 * 		ARRAY	- Task Position
 * 	Optional:
 * 		NUMBER	- Task Radius
 * 		NUMBER	- Wait Time at Waypoints
 * 		STRING	- Behaviour
 * 		STRING	- CombatMode
 * 		STRING	- Speed
 * 		STRING	- Formation
 * 		STRING	- Waypoint Type
 * 		STRING	- On Waypoint Complete Statement
 * 		NUMBER	- Waypoint Complete Radius
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params[["_blds",[],[[]]],"_grp","_pos",["_radius",0,[0]],["_wait",3,[0]],["_behave","SAFE",[""]],["_combat","RED",[""]],["_speed","LIMITED",[""]],["_formation","WEDGE",[""]],["_type","MOVE",[""]],["_oncomplete","",[""]],["_compradius",0,[0]],["_bldPos",[],[[]]],["_patrol",false,[false]]];
	_grp call UO_AI_fnc_taskReset;
	private _bpos = _pos;
	if(count _blds < 1) then {
		_blds = [_pos,_radius,(count (units _grp))] call UO_AI_fnc_getRandomBuildings;
		if(count _blds < 1) then {
			_bpos = _pos;
			_patrol = true;
		} else {
			_bpos = getPosATL (_blds select 0);
		};
	};	
	if(_patrol) then {
		if(_radius < 1) then {_radius = 30;};
		[_grp,_bpos,_radius,_wait,_behave,_combat,_speed,_formation] spawn UO_AI_fnc_taskPatrol;
	} else {
		[0,"ARRAY",1,_bpos,_this] call UO_AI_fnc_createWaypointModified;
		deleteWaypoint ((waypoints _grp) select 0);
		while {{alive _x} count (units _grp) <= ((count (units _grp)) * 0.5) || (((getPosATL leader _grp) distance _pos) > 30)} do { sleep 5; };	
		{
			_x setvariable["aeOccupy",true];
			private _uBld = _blds select (_forEachIndex % (count _blds));
			_bldPos = _uBld buildingPos -1; 
			[_x,_uBld,_bldPos,_wait,[_behave,_combat,_speed,_formation]] spawn UO_AI_fnc_taskBuildingPatrol;
		} forEach (units _grp);
	};
	if(UO_FW_AI_DEBUG) then {
		if(_patrol) then {
			[_grp,_bpos,"BLD ERROR PATROL","ColorOPFOR"] spawn UO_AI_fnc_debugCreateMarker;
		} else {			
			{
				[_grp,(getPosATL _x),format["gBldP%1",_forEachIndex]] spawn UO_AI_fnc_debugCreateMarker;
			} forEach _blds;
		};
	};
	true