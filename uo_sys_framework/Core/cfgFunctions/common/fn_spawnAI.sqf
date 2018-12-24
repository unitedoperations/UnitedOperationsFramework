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

private _unit = (_this select 0) createUnit [(_this select 1),(_this select 2), [], 0, "NONE"];
if(!isNil "UO_FW_aCount_event_addEH") then { ["UO_FW_aCount_event_addEH", _unit] call CBA_fnc_serverEvent};
_this call UO_FW_FNC_trackUnit;
_unit
