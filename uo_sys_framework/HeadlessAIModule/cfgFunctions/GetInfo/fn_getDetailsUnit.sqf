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
params ["_unit",["_pos",[],[[]]],"_vehicle"];
private _unitInit = (MGETVAR(_unit,AI_unitInit,""));
if (typename _unitInit isEqualTo "STRING") then {_unitInit = compile _unitInit;};
private _vehAssigned = if ((assignedVehicleRole _unit) isEqualTo []) then {false} else {true};
[true,
typeOf _unit,
_pos,
vectorDir _unit,
vectorUp _unit,
damage _unit,
getUnitLoadout _unit,
typeOf _vehicle,
assignedVehicleRole _unit,
_vehAssigned,
_unit getVariable ["ACE_captives_isHandcuffed",false],
(surfaceIsWater (getposATL _unit)),
(MGETVAR(_unit,AI_unitPersistent,true)),
(MGETVAR(_unit,AI_stance,"AUTO")),
_unitInit,
(MGETVAR(_unit,AI_unitName,"")),
(MGETVAR(_unit,AI_unitIdentity,""))]
