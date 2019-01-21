/*
 * Author: Olsen
 *
 * If unit respawns as playable, register it spawning, if respawns as spectator, stop tracking.
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

params ["_new"];

if (!(_new getVariable "UO_FW_Dead")) then {
    _new call UO_FW_fnc_EventSpawned;
} else {
    _new call UO_FW_fnc_UntrackUnit;
};
