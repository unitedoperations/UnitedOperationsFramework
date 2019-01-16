#define COMPONENT AutoTrack
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

if !(UO_FW_Server_AUTOTRACKASSETMODULE_Allowed) exitwith {};
if !(missionNamespace getVariable ["UO_FW_AutoTrackAsset_Enabled",false]) exitWith {};

["Auto Track Assets", "Automatically runs UO_FW_FNC_TrackAsset on AI vehicles.", "Starfox64 and Sacher"] call UO_FW_fnc_RegisterModule;
[{CBA_missionTime > 1},{
	{
		private _vehicle = _x;
		if ((!isPlayer _vehicle) && {!(side _vehicle isEqualto civilian)}) then {
			if (_vehicle getVariable ["UO_FW_AssetName", ""] isEqualto "") then {
				{
					if ((_x select 1) isEqualto (side _vehicle)) exitWith {
						private _vehCfg = (configFile >> "CfgVehicles" >> (typeOf _vehicle));
						if (isText(_vehCfg >> "displayName")) then {
							[_vehicle, getText(_vehCfg >> "displayName"), (_x select 0)] call UO_FW_FNC_TrackAsset;
						};
					};
				} forEach UO_FW_Teams;
			};
		};
	} forEach vehicles;
}] call CBA_fnc_WaitUntilAndExecute;
