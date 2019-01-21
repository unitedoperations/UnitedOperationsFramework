#define COMPONENT AutoTrack
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

params ["_vehicle"];

["UO_FW_SettingsLoaded", {
    if !(UO_FW_Server_AUTOTRACKASSETMODULE_Allowed) exitwith {};
    if !(UO_FW_GETMVAR(AutoTrackAsset_Enabled,false)) exitWith {};
    ["UO_FW_RegisterModuleEvent", ["Auto Track Assets", "Automatically runs Asset Tracking on AI vehicles.", "Starfox64, Sacher and PiZZADOX"]] call CBA_fnc_globalEvent;
    [{(!isNull (_this select 0))},{
        params ["_vehicle"];
        if ((!isPlayer _vehicle) && {!(side _vehicle isEqualto civilian)}) then {
            if (UO_FW_GETVAR(_vehicle,UO_FW_AssetName,"")) then {
                {
                    _x params ["_name", "_side", "_type", "_start", "_current", "_disabled", "_destroyed"];
                    if (_side isEqualto (side _vehicle)) exitWith {
                        private _vehCfg = (configFile >> "CfgVehicles" >> (typeOf _vehicle));
                        if (isText(_vehCfg >> "displayName")) then {
                            ["UO_FW_TrackAsset_Event",[_vehicle, getText(_vehCfg >> "displayName"), _name]] call CBA_fnc_serverEvent;
                        };
                    };
                } forEach UO_FW_Teams;
            };
        };
    }, [_vehicle]] call CBA_fnc_WaitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
