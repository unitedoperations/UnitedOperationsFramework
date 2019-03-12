/*    Description: Calculate Shot Count
 *    Arguments:
 *         N/A
 *    Return Value:
 *         ARRAY
 *    Author
 *        TinfoilHate
 */

#define COMPONENT ShotCount
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(SERVER);

params ["_side","_class"];
private ["_teamvar"];

switch (_side) do {
    case west: {
        if (isNil QGVAR(ExpendedAmmunition_BLUFOR)) then {GVAR(ExpendedAmmunition_BLUFOR) = [];};
        _teamvar = GVAR(ExpendedAmmunition_BLUFOR);
    };
    case east: {
        if (isNil QGVAR(ExpendedAmmunition_OPFOR)) then {GVAR(ExpendedAmmunition_OPFOR) = [];};
        _teamvar = GVAR(ExpendedAmmunition_OPFOR);
    };
    case independent: {
        if (isNil QGVAR(ExpendedAmmunition_Indfor)) then {GVAR(ExpendedAmmunition_Indfor) = [];};
        _teamvar = GVAR(ExpendedAmmunition_Indfor);
    };
    case civilian: {
        if (isNil QGVAR(ExpendedAmmunition_Civilian)) then {GVAR(ExpendedAmmunition_Civilian) = [];};
        _teamvar = GVAR(ExpendedAmmunition_Civilian);
    };
};

//IGNORE_PRIVATE_WARNING ["_x"];
private _foundClass = _teamvar findIf {(_x select 0) isEqualto _class};
if (_foundClass isEqualto -1) then {
    _teamvar pushBack [_class,1];
} else {
    private _index = (_teamvar select _foundClass);
    _index params ["_name","_count"];
    _teamvar set [_foundClass,[_name,(_count + 1)]];
};
