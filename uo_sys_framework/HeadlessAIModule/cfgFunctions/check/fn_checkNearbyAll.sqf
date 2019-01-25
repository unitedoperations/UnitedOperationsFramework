/*    Author: Original Author Unknown  - Edited by suits
 *     Checks if any units are within the radius of a specific position.
 *     Arguments:
 *         (Optional)
 *        ARRAY    - Position - Position to check from.
 *        NUMBER    - Radius - Distance from position checking from.
 *        ARRAY    - Side - Side of player.
 *        ARRAY    - Types - Types of units to check for.
 *     Return Value:
 *         NUMBER    - A count of any units of specified type within the given radius of selected position.
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params [
    ["_pos",[0,0,0],[[]],[3]],
    ["_radius",5,[0]],
    ["_side",[west],[[]]],
    ["_Types",["CAManBase","LandVehicle","Ship","Helicopter","Plane"],[[]]],
    ["_EnabledEntities",[],[[]]]
];
if !(_side isEqualType []) then { _side = [_side] };
if !(_Types isEqualType []) then { _Types = [_Types] };
private _nearEntities = _pos nearEntities [_Types,_radius];
{
    if ((side _x) in _side && {(alive _x)}) then { _EnabledEntities set [ count _EnabledEntities, _x] };
} forEach _nearEntities;
_EnabledEntities
