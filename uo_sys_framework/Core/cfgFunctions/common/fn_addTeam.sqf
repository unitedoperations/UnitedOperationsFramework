/*
 * Author: Olsen
 *
 * Adds new team.
 *
 * Arguments:
 * 0: side of new team <side>
 * 1: name of new team <string>
 * 2: type of new team: "ai"/"player"/"both" <string>
 *
 * Return Value:
 * nothing
 *
 * Public: Yes
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(SERVER);

params [["_side", sideUnknown, [sideUnknown]],["_name", "Unknown", [""]],["_Type", "both", [""]]];

if (isMultiplayer) then {
    EGVAR(Core,Teams) set [count EGVAR(Core,Teams), [_name, _side, _Type,  0, 0, [], []]];
} else {
    EGVAR(Core,Teams) set [count EGVAR(Core,Teams), [_name, _side, "both",  0, 0, [], []]];
};
