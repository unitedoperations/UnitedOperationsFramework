#define COMPONENT AutoTrack
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

params ["_marker", "_team"];
private ["_vehicle", "_vehCfg"];
{
	_vehicle = _x;
	if (_vehicle inArea _marker) then {
		{
			if ((_x select 0) isEqualto _team) exitWith {
				_vehCfg = (configFile >> "CfgVehicles" >> (typeOf _vehicle));
				if (isText(_vehCfg >> "displayName")) then {
					[_vehicle, getText(_vehCfg >> "displayName"), _team] call UO_FW_FNC_TrackAsset;
				};
			};
		} forEach UO_FW_Teams;
	};
} forEach vehicles;
