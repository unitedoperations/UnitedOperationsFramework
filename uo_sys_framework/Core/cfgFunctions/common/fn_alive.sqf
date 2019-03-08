/*
 * Author: Olsen
 *
 * Checks if unit is considered alive by framework
 *
 * Arguments:
 * 0: unit <object>
 *
 * Return Value:
 * is alive <bool>
 *
 * Public: Yes
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

params ["_unit"];

(alive _unit) && {!(GETVAR(_unit,Dead,false))}
