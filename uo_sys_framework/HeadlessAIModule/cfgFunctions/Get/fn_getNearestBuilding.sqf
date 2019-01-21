/*    Description: Returns nearest enterable building max 3km away.
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
params ["_pos",["_radius",500,[0]],["_blds",[],[[]]],["_nbld",objNull,[objNull]],"_i"];
    for [{_i=0},{isNull _nbld && _radius < 3000},{_i = _i + 1}] do {
        if (_i > 1) then {_radius = _radius + 500};
        _blds = [_pos,_radius] call UO_FW_AI_fnc_getBuildings;
        if (count _blds > 0) then {
            _nbld = _blds select 0;
        };
    };
    _nbld