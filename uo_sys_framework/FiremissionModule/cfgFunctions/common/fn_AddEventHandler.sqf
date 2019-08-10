#include "..\..\Global\defs.hpp"
#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"

if (!((_this) getVariable [QEGVAR(Firemission,ArtHasEH),false])) then {
        (_this) addeventhandler ["fired", {
                params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
                if((GETVAR(_x,ArtilleryUnlimitedAmmo,false))) then {
                        _unit setvehicleammo 1;
                };
                        deleteVehicle _projectile;
                }];
        (_this) setVariable [QEGVAR(Firemission,ArtHasEH),true];
};
