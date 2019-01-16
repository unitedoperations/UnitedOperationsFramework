/*	Description: Used for replicating a squads position relative to the squad leader.
 * 	Arguments:
 * 		ARRAY	- New Group Position
 * 		OBJECT	- Group leader to base positions off
 *		OBJECT	- Unit to find new position for
 * 	Return Value:
 * 		ARRAY 	- New Position for Unit
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_newPos","_grpldr","_u",["_pos",[],[[]]]];
	private _grpPos = getPosATL _grpldr;                            
	private _unitPos = getpos _u;
	private _dist = _grpPos distance _unitPos; 
	private _dir = _grpPos getDir _unitPos;
	_pos = [_newPos, _dist, _dir] call BIS_fnc_relPos;   
	_pos