/*	Description: Returns a random enterable buildings with in the given radius
 * 	Arguments:
 * 		ARRAY	- Position
 *	Optional:
 * 		NUMBER	- Radius to generate list of buildings from.
 * 	Return Value:
 * 		OBJECT	- Random Building with in Radius
 *	Author
 *		suits & PiZZADOX
 */		
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params ["_pos",["_radius",500,[0]],["_rbld",objNull,[objNull]]];
	_rbld = selectRandom ([_pos,_radius] call UO_FW_AI_fnc_getBuildings);
    _rbld