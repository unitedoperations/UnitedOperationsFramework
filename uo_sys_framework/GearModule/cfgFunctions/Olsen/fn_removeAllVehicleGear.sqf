/*
 * Author: Olsen
 *
 * Remove all gear from vehicle.
 *
 * Arguments:
 * 0: vehicle <object>
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_vehicle"];

clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
