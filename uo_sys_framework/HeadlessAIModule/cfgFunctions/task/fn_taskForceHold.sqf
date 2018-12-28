/*	Description: Task a group to hold position no matter what.
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
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)
params["_grp",["_behave","SAFE",[""]],["_combat","RED",[""]],["_speed","LIMITED",[""]],["_formation","WEDGE",[""]],"_i"];
{_x forcespeed -1; _x enableAI "PATH";} foreach units _grp;
_grp setBehaviour _behave;
_grp setCombatMode _combat;
_grp setSpeedMode _speed;
_grp setFormation _formation;
private _units = units _grp;
for [{_i=0},{(_i < count _units)},{_i = _i + 1}] do {
	private _u = _units select _i;
	_u doWatch ((getPosATL _u) vectorAdd((vectorDir _u) vectorMultiply 100));
	_u disableAI "PATH";
};
_grp setvariable ["InitialWPSet",true];
_grp setVariable ["UO_FW_AI_Mission","FORCE HOLD"];
true
