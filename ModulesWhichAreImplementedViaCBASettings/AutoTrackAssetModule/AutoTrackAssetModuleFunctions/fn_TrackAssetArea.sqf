

    private ["_marker", "_team", "_vehicle", "_vehCfg"];

    _marker = _this select 0;
    _team = _this select 1;

    {

        _vehicle = _x;

        if ([_vehicle, _marker] call UO_FNC_InArea) then {

            {

                if ((_x select 0) == _team) exitWith {

                    _vehCfg = (configFile >> "CfgVehicles" >> (typeOf _vehicle));

                    if (isText(_vehCfg >> "displayName")) then {

                        [_vehicle, getText(_vehCfg >> "displayName"), _team] call UO_FNC_TrackAsset;

                    };

                };

            } forEach FW_Teams;

        };

    } forEach vehicles;
