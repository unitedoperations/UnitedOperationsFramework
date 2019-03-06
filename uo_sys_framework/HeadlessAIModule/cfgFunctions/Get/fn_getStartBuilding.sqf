/*    Description: Get building and position for units that are starting in buildings.
 *     Arguments:
 *         ARRAY    - Group Start Position
 *        NUMBER    - Task Radius
 *        NUMBER    - Units Group Number
 *     Return Value:
 *         ARRAY     - Unit House Position
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_gpos","_taskRadius","_i",["_pos",[],[[]]]];
private _bp = (([_gpos,_taskRadius] call EFUNC(AI,getNearestBuilding)) buildingPos -1);
if ((count _bp) >= 1) then {
    _pos = _bp select (_i % (count _bp));
} else {
    if (_bp isEqualTo []) then {
        LOG_1("Group at %1 was unable to detect any enterable buildings within range.",_gpos);
    };
};
_pos
