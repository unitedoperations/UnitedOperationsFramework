params ["_target", "_caller"];
if (!isNull (_target getVariable ["aidrivers_driver", objNull])) then {
    [_target] call UO_fnc_AIDriversRemoveUnit;
} else {
    [_target, _caller] call UO_fnc_AIDriversCreateUnit;
};
