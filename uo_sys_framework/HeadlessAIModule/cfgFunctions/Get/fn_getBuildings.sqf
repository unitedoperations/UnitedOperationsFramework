/*	Description: Returns an array of enterable buildings with in the given radius sorted closest to furthest.
 * 	Arguments:
 * 		ARRAY	- Position
 *	Optional:
 * 		NUMBER	- Radius to generate list of buildings from.
 * 	Return Value:
 * 		ARRAY	- List of Buildings
 *	Author
 *		suits & PiZZADOX
 */		
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_pos",["_radius",100,[0]],["_blds",[],[[]]]];
	private _getblds = (_pos nearObjects ["building",_radius]) select {count(_x buildingPos -1) > 0};	
	if(count _getblds < 1) exitWith {[objNull]};
	private _xbld = _getblds apply {[_x distance _pos, _x]};
	_xbld sort true;
	_blds = _xbld apply {_x select 1};	
    _blds