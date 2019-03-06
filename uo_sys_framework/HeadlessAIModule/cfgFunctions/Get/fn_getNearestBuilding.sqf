/*    Description: Returns nearest enterable building
 *     Arguments:
 *         ARRAY    - Position
 *    Optional:
 *         NUMBER    - Radius to generate list of buildings from.
 *     Return Value:
 *         OBJECT    - Nearest Building
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_pos",["_radius",500,[0]]];
private ["_nbld"];
private _blds = [_pos,_radius] call EFUNC(AI,getBuildings);
if (_blds isEqualTo []) then {
    _blds = [_pos,(_radius + 500)] call EFUNC(AI,getBuildings);
    if !(_blds isEqualTo []) then {
        _nbld = _blds select 0;
    };
} else {
    _nbld = _blds select 0;
};
_nbld
