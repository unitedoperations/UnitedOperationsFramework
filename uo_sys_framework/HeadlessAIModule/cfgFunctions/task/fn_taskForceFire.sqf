#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_unit","_target",["_rounds",1,[0]],["_fireMode","close",[""]]];
_unit doWatch _target;
/*waitUntil {
    sleep 0.2;
    if ((direction _unit) == ([_unit,_target] call BIS_fnc_relativeDirTo)) exitWith {
          for "_i" from 0 to (count _rounds) do {
            _unit forceWeaponFire [ currentWeapon _unit, _fireMode];
          };
      };
    false
};
*/
