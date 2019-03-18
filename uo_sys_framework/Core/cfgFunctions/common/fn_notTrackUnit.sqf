/*
 * Author: Olsen
 *
 * Disable tracking of unit by framework.
 * Unit will be ignored in casualty count etc.
 *
 * Arguments:
 * 0: unit to not track <object>
 *
 * Return Value:
 * nothing
 *
 * Public: Yes
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

[QGVAR(DontTrackEvent), []] call CBA_fnc_serverEvent;
