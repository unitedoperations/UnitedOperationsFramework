/*	Description: Returns nearest enterable building max 3km away.
 * 	Arguments:
 * 		ARRAY	- Position
 *	Optional:
 * 		NUMBER	- Radius to get buildings from with in.
 *		NUMBER	- Max Amount of Buildings to Return.
 * 	Return Value:
 * 		ARRAY	- Nearest Buildings
 *	Author
 *		suits & PiZZADOX
 */		
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)
params ["_pos",["_radius",500,[0]],["_bldAmt",25,[0]],["_blds",[],[[]]],"_i"];
    for [{_i=0},{(count _blds) < 1 && _radius < 3000},{_i = _i + 1}] do {
        if(_i > 1) then {_radius = _radius + 500};
        _blds = [_pos,_radius] call UO_FW_AI_fnc_getBuildings;
		if(count _blds > _bldAmt) then {	
			_blds resize _bldAmt;
		};
	};
	_blds