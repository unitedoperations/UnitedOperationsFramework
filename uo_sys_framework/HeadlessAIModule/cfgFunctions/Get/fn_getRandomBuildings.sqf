/*	Description: Returns random enterable buildings with in the given radius
 * 	Arguments:
 * 		ARRAY	- Position
 *	Optional:
 * 		NUMBER	- Radius to get buildings from with in.
 *		NUMBER	- Max Amount of Buildings to Return.
 * 	Return Value:
 * 		ARRAY	- Random Buildings with in Radius
 *	Author
 *		suits & PiZZADOX
 */		
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_pos",["_radius",500,[0]],["_bldAmt",25,[0]],["_blds",[],[[]]],["_rblds",[],[[]]],["_bIndex",[],[[]]],"_b","_i"];
	_rblds = [_pos,_radius] call UO_FW_AI_fnc_getBuildings;
    for [{_i=0},{(_i < _bldAmt && (count _rblds) > 0)},{_i = _i + 1}] do {
        _index = (floor random (count _rblds));
        private _bld = _rblds select _index;
        _blds pushBack _bld;
        _rblds deleteAt _index;
    };
    _blds