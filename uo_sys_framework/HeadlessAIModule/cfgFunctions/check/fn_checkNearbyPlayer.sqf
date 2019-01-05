/*	Author: Original Author Unknown  - Edited by suits
 * 	Checks if any players are within the radius of a specific position.
 * 	Arguments:
 * 		(Optional)
 *		ARRAY	- Position - Position to check from.
 *		NUMBER	- Radius - Distance from position checking from.
 *		ARRAY	- Side - Side of player.
 *		ARRAY	- Types - Types of units to check for.
 * 	Return Value:
 * 		NUMBER	- A count of players of specified type within the given radius of selected position.
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
private ["_pos","_radius","_side","_types","_enabledEntities","_nearEntities"];
params [["_pos",[0,0,0],[[]],[3]],["_radius",5,[0]],["_side",[west],[[]]],["_types",["CAManBase","LandVehicle","Ship","Helicopter","Plane"],[[]]]];
if(typeName _side != typeName [] ) then { _side = [_side] };
if(typeName _types != typeName [] ) then { _types = [_types] };
_enabledEntities	= [];
_nearEntities		= _pos nearEntities [_types,_radius];
{
	if( (isPlayer _x) && (side _x) IN _side && (alive _x) ) then { _enabledEntities set [ count _enabledEntities, _x] };
} forEach _nearEntities;
_enabledEntities
