/*    Description: Returns nearest enterable buildings
 *     Arguments:
 *         ARRAY    - Position
 *    Optional:
 *         NUMBER    - Radius to get buildings from with in.
 *        NUMBER    - Max Amount of Buildings to Return.
 *     Return Value:
 *         ARRAY    - Nearest Buildings
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_pos",["_radius",500,[0]],["_bldAmt",25,[0]]];
private _blds = [_pos,_radius] call EFUNC(AI,getBuildings);
if (_blds isEqualTo []) then {
    _blds = [_pos,(_radius + 500)] call EFUNC(AI,getBuildings);
    if (count _blds > _bldAmt) then {
        _blds resize _bldAmt;
    };
} else {
    if (count _blds > _bldAmt) then {
        _blds resize _bldAmt;
    };
};
_blds
