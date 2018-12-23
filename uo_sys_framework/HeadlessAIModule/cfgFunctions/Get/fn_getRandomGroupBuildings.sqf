/*	Description: Returns an random group of enterable buildings with in the given radius.
 * 	Arguments:
 * 		ARRAY	- Position
 *	Optional:
 * 		NUMBER	- Radius to generate list of buildings from.
 *		NUMBER 	- Max Amount of Buildings to return
 * 	Return Value:
 * 		ARRAY	- Group of Buildings
 *	Author
 *		suits & PiZZADOX
 */		
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)
params ["_pos",["_radius",500,[0]],["_amount",3,[0]],["_blds",[],[[]]]];
	_blds = [_pos,_radius,_amount] call UO_FW_AI_fnc_getRandomBuildings;	
    _blds