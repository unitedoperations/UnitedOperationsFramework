/*	Description: Task a group to hold position until contact with enemy.
 * 	Arguments:
 * 		GROUP	- Group
 * 	Optional:
 * 		STRING	- Behaviour
 * 		STRING	- CombatMode
 * 		STRING	- Speed
 * 		STRING	- Formation
 * 	Return Value:
 * 		BOOL 	- True
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params["_grp",["_behave","SAFE",[""]],["_combat","RED",[""]],["_speed","LIMITED",[""]],["_formation","WEDGE",[""]],"_i"];
	_grp call UO_FW_AI_fnc_taskReset;
	_grp setBehaviour _behave;
	_grp setCombatMode _combat;
	_grp setSpeedMode _speed;
	_grp setFormation _formation;	
	private _units = units _grp;	
	for [{_i=0},{(_i < count _units)},{_i = _i + 1}] do {
		private _u = _units select _i;
		_u doWatch ((getPosATL _u) vectorAdd((vectorDir _u) vectorMultiply 100));
		doStop _u;
	};
	true