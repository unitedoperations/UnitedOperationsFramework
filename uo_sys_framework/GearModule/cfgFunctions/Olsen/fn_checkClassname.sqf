/*
 * Author: BlackHawk
 *
 * Check if item classname is valid.
 *
 * Arguments:
 * 0: classname <string>
 *
 * Return Value:
 * is valid <bool>
 *
 * Public: No
 */

#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params [
    ["_class", "", [""]],
    ["_unit", objNull, [objNull]]
];

private _result = (
    isClass (configfile >> "CfgWeapons" >> _class)
    || {(isClass (configFile >> "CfgMagazines" >> _class))}
    || {(isClass (configFile >> "CfgGlasses" >> _class))}
    || {(isClass (configFile >> "CfgVehicles" >> _class))}
);

if (!_result) then {
    if (!isMultiplayer) then {
        ERROR_1("Invalid classname given! %1",_class);
    };
    [_class, {
        params ["_class"];
        private _msg = "Framework has detected an invalid classname - " + str _class + "! Mission will continue but some parts of gear will be missing.";
        if (!isNil "GVAR(MissingGear)_found") then {
            if !(_class in GVAR(MissingGear)_found) then {
                systemChat _msg;
                diag_log _msg;
                GVAR(MissingGear)_found pushBackUnique _class;
            };
        } else {
            systemChat _msg;
            diag_log _msg;
            GVAR(MissingGear)_found = [_class];
        };
    }] remoteExec ["BIS_fnc_call", 0, true];

    if (!isNull _unit) then {
        [_class, _unit] remoteExecCall ["FUNC(makeUnitsList)", 2, false];
    };
};

_result
