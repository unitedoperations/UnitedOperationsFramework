#define COMPONENT AutoTrackAsset
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(SERVER);

if !(UO_FW_Server_AUTOTRACKASSETMODULE_Allowed) exitwith {};
if !(GETMVAR(Enabled,false)) exitWith {};

params ["_vehicle"];
[QEGVAR(Core,RegisterModuleEvent), ["Auto Track Assets", "Automatically runs Asset Tracking on AI vehicles.", "Starfox64, Sacher and PiZZADOX"]] call CBA_fnc_globalEvent;
[{(!isNull (_this select 0))},{
    params ["_vehicle"];
    if ((!isPlayer _vehicle) && {!(side _vehicle isEqualto civilian)}) then {
        if (GETVAR(_vehicle,AssetName,"")) then {
            {
                _x params ["_name", "_side", "_type", "_start", "_current", "_disabled", "_destroyed"];
                if (_side isEqualto (side _vehicle)) exitWith {
                    private _vehCfg = (configFile >> "CfgVehicles" >> (typeOf _vehicle));
                    if (isText(_vehCfg >> "displayName")) then {
                        [QEGVAR(Core,TrackAssetEvent),[_vehicle, getText(_vehCfg >> "displayName"), _name]] call CBA_fnc_serverEvent;
                    };
                };
            } forEach EGVAR(Core,Teams);
        };
    };
}, [_vehicle]] call CBA_fnc_WaitUntilAndExecute;
