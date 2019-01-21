/*    Author: Original Author Unknown  - Edited by suits
 *     Checks if any players are within the radius of a specific position.
 *     Arguments:
 *         (Optional)
 *        ARRAY    - Position - Position to check from.
 *        NUMBER    - Radius - Distance from position checking from.
 *        ARRAY    - Side - Side of player.
 *        ARRAY    - Types - Types of units to check for.
 *     Return Value:
 *         NUMBER    - A count of players of specified type within the given radius of selected position.
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
private ["_pos","_radius","_side","_Types","_EnabledEntities","_nearEntities"];
params [["_pos",[0,0,0],[[]],[3]],["_radius",5,[0]],["_side",[west],[[]]],["_Types",["CAManBase","LandVehicle","Ship","Helicopter","Plane"],[[]]]];
if (typeName _side != typeName [] ) then { _side = [_side] };
if (typeName _Types != typeName [] ) then { _Types = [_Types] };
_EnabledEntities    = [];
_nearEntities        = _pos nearEntities [_Types,_radius];
{
    if ( (isPlayer _x) && (side _x) IN _side && (alive _x) ) then { _EnabledEntities set [ count _EnabledEntities, _x] };
} forEach _nearEntities;
_EnabledEntities
