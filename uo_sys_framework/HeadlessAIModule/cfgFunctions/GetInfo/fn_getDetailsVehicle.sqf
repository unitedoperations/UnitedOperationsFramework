/*    Description: Returns an array of details for an occupied vehicle.
 *    Arguments:
 *         OBJECT    - Object Name
 *    Return Value:
 *         ARRAY
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_veh",["_pos",[],[[]]]];
private _vehInit = (MGETVAR(_veh,AI_vehInit,""));
if (typename _vehInit isEqualTo "STRING") then {_vehInit = compile _vehInit;};
if (_pos isEqualTo []) then {_pos = getPosATL _veh;};
[false,
typeOf _veh,
_pos,
vectorDir _veh,
vectorUp _veh,
damage _veh,
fuel _veh,
magazinesAllTurrets _veh,
locked _veh,
surfaceIsWater (getposATL _veh),
(MGETVAR(_veh,AI_vehName,"")),
(MGETVAR(_veh,AI_vehPersistent,true)),
_vehInit,
(MGETVAR(_veh,AI_unitFlying,false)),
(MGETVAR(_veh,AI_unitFlyInHeight,250))]
