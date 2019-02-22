#define COMPONENT AutoTrack
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

if !(UO_FW_Server_AUTOTRACKASSETMODULE_Allowed) exitwith {};
if !(GETMVAR(AutoTrackAsset_Enabled,false)) exitWith {};
["UO_FW_RegisterModuleEvent", ["Auto Track Assets", "Automatically runs Asset Tracking on AI vehicles.", "Starfox64, Sacher and PiZZADOX"]] call CBA_fnc_globalEvent;
params ["_marker", "_team"];
{
    private _vehicle = _x;
    if (_vehicle inArea _marker) then {
        {
            _x params ["_name", "_side", "_type", "_start", "_current", "_disabled", "_destroyed"];
            if (_name isEqualto _team) exitWith {
                private _vehCfg = (configFile >> "CfgVehicles" >> (typeOf _vehicle));
                if (isText(_vehCfg >> "displayName")) then {
                    ["UO_FW_TrackAsset_Event",[_vehicle, getText(_vehCfg >> "displayName"), _name]] call CBA_fnc_serverEvent;
                };
            };
        } forEach UO_FW_Teams;
    };
} forEach (vehicles select {local _x});
