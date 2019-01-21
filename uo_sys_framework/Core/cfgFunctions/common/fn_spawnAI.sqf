/*
 * Author: Sacher & PiZZADOX
 *
 * Spawns a AI Unit
 *
 * Arguments:
 * 0: group <group>
 * 1: className <String>
 * 2: Position <Pos>
 * Return Value:
 * unit Spawned <object>
 *
 * Public: Yes
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_group","_class","_pos"];

private _unit = _group createUnit [_class,[0,0,0], [], 0, "NONE"];
_unit setPos _pos;
if !(isNil "UO_FW_aCount_event_addEH") then {
    ["UO_FW_aCount_event_addEH", _unit] call CBA_fnc_serverEvent;
};
["UO_FW_Track_Event", _unit] call CBA_fnc_serverEvent;
_unit
