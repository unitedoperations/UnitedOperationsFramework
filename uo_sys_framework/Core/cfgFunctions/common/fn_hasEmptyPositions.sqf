/*
 * Author: Olsen
 *
 * Checks if vehicle has available positions
 *
 * Arguments:
 * 0: vehicle <object>
 *
 * Return Value:
 * has empty positions <bool>
 *
 * Public: Yes
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

params ["_vehicle"];

(_vehicle emptyPositions "Cargo" != 0 || _vehicle emptyPositions "Gunner" != 0 || _vehicle emptyPositions "Commander" != 0 || _vehicle emptyPositions "Driver" != 0)
