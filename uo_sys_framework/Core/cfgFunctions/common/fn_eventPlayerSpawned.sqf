/*
 * Author: Olsen
 *
 * Duplicate. Calls UO_FW_fnc_TrackUnit.
 *
 * Arguments:
 * 0: unit to track <object>
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

params ["_unit"];
_unit call UO_FW_fnc_TrackUnit;
