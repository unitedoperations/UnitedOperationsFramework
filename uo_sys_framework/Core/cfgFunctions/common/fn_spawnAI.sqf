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

params ["_group","_class","_pos"];

private _unit = _group createUnit [_class,[0,0,0], [], 0, "NONE"];
_unit setPos _pos;
if !(isNil "UO_FW_aCount_event_addEH") then {
	["UO_FW_aCount_event_addEH", _unit] call CBA_fnc_serverEvent;
};
_unit call UO_FW_FNC_trackUnit;
_unit
