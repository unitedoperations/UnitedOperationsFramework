/*	Author: Original Author Unknown  - Edited by suits
 * 	Checks if any units are within the radius of a specific position.
 * 	Arguments:
 * 		(Optional)
 *		ARRAY	- Position - Position to check from.
 *		NUMBER	- Radius - Distance from position checking from.
 *		ARRAY	- Side - Side of player.
 *		ARRAY	- Types - Types of units to check for.
 * 	Return Value:
 * 		NUMBER	- A count of any units of specified type within the given radius of selected position.
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)

params [
	["_pos",[0,0,0],[[]],[3]],
	["_radius",5,[0]],
	["_side",[west],[[]]],
	["_types",["CAManBase","LandVehicle","Ship","Helicopter","Plane"],[[]]],
	["_enabledEntities",[],[[]]]
];
	if(typeName _side != typeName [] ) then { _side = [_side] };
	if(typeName _types != typeName [] ) then { _types = [_types] };
	private _nearEntities = _pos nearEntities [_types,_radius];
	{
		if( (side _x) IN _side && (alive _x) ) then { _enabledEntities set [ count _enabledEntities, _x] };
	}forEach _nearEntities;
	_enabledEntities
