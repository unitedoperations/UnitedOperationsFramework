_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    ["Auto Track Assets", "Automatically runs FNC_TrackAsset on AI vehicles.", "Starfox64"] call UO_FNC_RegisterModule;

    private ["_vehicle", "_vehCfg"];
    if(isServer) then
    {
        sleep(1);

        {

            _vehicle = _x;

            if (!isPlayer _vehicle && side _vehicle != civilian) then {

                if (_vehicle getVariable ["FW_AssetName", ""] == "") then {

                    {

                        if (_x select 1 == side _vehicle) exitWith {

                            _vehCfg = (configFile >> "CfgVehicles" >> (typeOf _vehicle));

                            if (isText(_vehCfg >> "displayName")) then {

                                [_vehicle, getText(_vehCfg >> "displayName"), _x select 0] call UO_FNC_TrackAsset;

                            };

                        };

                    } forEach FW_Teams;

                };

            };

        } forEach vehicles;
    };
};
