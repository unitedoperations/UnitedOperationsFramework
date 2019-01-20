/*
 * Author: Sacher & PiZZADOX
 *
 * Spawns a Vehicle, if side is defined it will try to track it
 *
 * Arguments:
 * 0: className <String>
 * 1: Position <Pos>
 * 2: side <side>
 * Return Value:
 * unit Spawned <object>
 *
 * Public: Yes
 */

params ["_class","_pos",["_side",""]];

private _vehicle = _class createVehicle [0,0,0];
_vehicle setpos _pos;
if (!isNil "UO_FW_aCount_event_addEH") then {
    ["UO_FW_aCount_event_addEH", _vehicle] call CBA_fnc_serverEvent;
};
if (((_vehicle getVariable ["UO_FW_AssetName", ""]) isEqualto "") && {!(_side isEqualto "")}) then {
  {
    if ((_x select 1) isEqualto _side) exitWith {
      private _vehCfg = (configFile >> "CfgVehicles" >> (typeOf _vehicle));
      if (isText(_vehCfg >> "displayName")) then {
        [_vehicle, (getText(_vehCfg >> "displayName")), (_x select 0)] call UO_FW_fnc_TrackAsset;
      };
    };
  } forEach UO_FW_Teams;
};
_vehicle
