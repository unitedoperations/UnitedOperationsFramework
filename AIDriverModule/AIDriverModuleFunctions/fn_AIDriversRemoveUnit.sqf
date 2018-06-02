params ["_target"];

private _driver = _target getVariable ["aidrivers_driver", objNull];

if (!isNull _driver) then {
    deleteVehicle _driver;
    private _handle = _target getVariable ["aidrivers_pfhID", []];
    if ((count _handle) != 0) then {
        [_handle select 1] remoteExec ["CBA_fnc_removePerFrameHandler", _handle select 0];
    };
};
hint "Driver removed";
