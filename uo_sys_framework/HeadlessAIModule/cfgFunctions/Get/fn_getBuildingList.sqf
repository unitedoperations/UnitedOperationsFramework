/*    Description: Get the building or buildings for the group to occupy.
 *     Arguments:
 *         ARRAY    - Position
 *         NUMBER    - Radius to get buildings from.
 *         NUMBER    - Occupy Option
 *         NUMBER    - Amount of units in group
 *     Return Value:
 *         ARRAY     - BUILDING, BUILDING POSITIONS
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_pos","_radius","_occupy","_grpcount",["_bld",[],[[]]],["_bldPos",[],[[]]]];
switch (_occupy) do {
    case 2: {
        _bld pushBack ([_pos,_radius] call EFUNC(AI,getNearestBuilding));
        _bldPos = (_bld select 0) buildingPos -1;
    };
    case 3: {
        _bld pushBack ([_pos,_radius] call EFUNC(AI,getRandomBuilding));
        _bldPos = (_bld select 0) buildingPos -1;
    };
    case 4: {
        _bld = [_pos,_radius] call EFUNC(AI,getNearestGroupBuildings);
    };
    case 5: {
        _bld = [_pos,_radius] call EFUNC(AI,getRandomGroupBuildings);
    };
    case 6: {
        _bld = [_pos,_radius,_grpcount] call EFUNC(AI,getNearestBuildings);
    };
    case 7: {
        _bld = [_pos,_radius,_grpcount] call EFUNC(AI,getRandomBuildings);
    };
    default {
        _bld pushBack (nearestBuilding _pos);
        _bldPos = (_bld select 0) buildingPos -1;
    };
};
[_bld,_bldPos]
