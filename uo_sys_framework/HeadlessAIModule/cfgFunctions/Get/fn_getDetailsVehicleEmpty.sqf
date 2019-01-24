/*    Description: Returns an array of details for an empty vehicle.
 *    Arguments:
 *         OBJECT    - Object Name
 *    Return Value:
 *         ARRAY
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_obj",["_pos",[],[[]]]];
private _unitInit = _obj getVariable ["UO_FW_AI_unitInit",""];
if (typename _unitInit isEqualTo "STRING") then {_unitInit = compile _unitInit;};
if (_pos isEqualTo []) then {_pos = (getposATL _obj)};
[typeOf _obj,
_pos,
vectorDir _obj,
vectorUp _obj,
damage _obj,
fuel _obj,
magazinesAllTurrets _obj,
locked _obj,
surfaceIsWater (getposATL _obj),
_obj getVariable ["UO_FW_AI_unitName",""],
_obj getVariable ['UO_FW_AI_unitPersistent',true],
_unitInit]
