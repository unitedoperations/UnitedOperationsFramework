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
params ["_veh","_pos"];
private _vehInit = (GETVAR(_veh,AI_vehInit,"true"));
if (typename _vehInit isEqualTo "STRING") then {_vehInit = compile _vehInit;};
if (_pos isEqualTo []) then {_pos = getPosATL _veh;};
private _vehGearSystemType = GETVAR(_veh,AI_Gear_VehicleSystemType,"NONE");
private _vehGearType = "NONE";
switch (_vehGearSystemType) do {
    case "OLSEN": {
        _vehGearType = (GETVAR(_veh,UO_FW_AI_Gear_VehicleGearManualType,""));
        if (_vehGearType isEqualto "") then {
            ERROR_1("Veh %1 is set to manual loadout but has none!",_veh);
        };
    };
    case "NONE": {_vehGearType = "NONE";};
    default {_vehGearType = "NONE";};
};
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
(GETVAR(_veh,AI_vehName,"")),
(GETVAR(_veh,AI_vehPersistent,true)),
_vehInit,
_vehGearSystemType,
_vehGearType,
(GETVAR(_veh,AI_vehFlying,false)),
(GETVAR(_veh,AI_vehFlyInHeight,250))]
