/*	Description: Set group behaviours.
 * 	Arguments:
 * 		GROUP	- Group
 * 		STRING	- Behaviour
 * 		STRING	- CombatMode
 * 		STRING	- Speed
 * 		STRING	- Formation
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
params ["_grp",["_behave","SAFE",[""]],["_combat","RED",[""]],["_speed","LIMITED",[""]],["_formation","WEDGE",[""]]];	
	_grp setBehaviour _behave;
	_grp setCombatMode _combat;
	_grp setSpeedMode _speed;
	_grp setFormation _formation;
	true