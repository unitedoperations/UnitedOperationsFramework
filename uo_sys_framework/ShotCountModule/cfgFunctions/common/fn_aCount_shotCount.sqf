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
UO_FW_EXEC_CHECK(SERVER);

params ["_side","_class"];
private ["_teamvar"];

switch (_side) do {
    case west: {
        if (isNil "UO_FW_ShotCount_ExpendedAmmunition_BLUFOR") then {UO_FW_ShotCount_ExpendedAmmunition_BLUFOR = [];};
        _teamvar = UO_FW_ShotCount_ExpendedAmmunition_BLUFOR;
    };
    case east: {
        if (isNil "UO_FW_ShotCount_ExpendedAmmunition_OPFOR") then {UO_FW_ShotCount_ExpendedAmmunition_OPFOR = [];};
        _teamvar = UO_FW_ShotCount_ExpendedAmmunition_OPFOR;
    };
    case independent: {
        if (isNil "UO_FW_ShotCount_ExpendedAmmunition_INDFOR") then {UO_FW_ShotCount_ExpendedAmmunition_INDFOR = [];};
        _teamvar = UO_FW_ShotCount_ExpendedAmmunition_INDFOR;
    };
    case civilian: {
        if (isNil "UO_FW_ShotCount_ExpendedAmmunition_CIV") then {UO_FW_ShotCount_ExpendedAmmunition_CIV = [];};
        _teamvar = UO_FW_ShotCount_ExpendedAmmunition_CIV;
    };
};

//IGNORE_PRIVATE_WARNING ["_x"];
private _foundClass = _teamvar findIf {(_x select 0) isEqualto _class};
if (_foundClass isEqualto -1) then {
    _teamvar pushBack [_class,1];
} else {
    private _index = (_teamvar select _foundClass);
    _index set [1,(_index select 1) + 1];
};
