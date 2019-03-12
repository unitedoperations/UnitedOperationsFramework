/*    Description: Returns the nearest group of enterable buildings max 3km away.
 *     Arguments:
 *         ARRAY    - Position
 *    Optional:
 *         NUMBER    - Radius to generate list of buildings from.
 *         BOOL    - Random Building List
 *        NUMBER     - Max Amount of Buildings to return
 *     Return Value:
 *         ARRAY    - Group of Closest Buildings
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_pos",["_radius",500,[0]],["_amount",3,[0]],["_blds",[],[[]]]];
_blds = [_pos,_radius,_amount] call EFUNC(AI,getNearestBuildings);
_blds
