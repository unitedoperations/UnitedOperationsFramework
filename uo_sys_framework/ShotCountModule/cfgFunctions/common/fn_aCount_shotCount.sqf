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
        if (isNil "UO_FW_aCount_west_ExpendedAmmunition") then {UO_FW_aCount_west_ExpendedAmmunition = [];};
        _teamvar = UO_FW_aCount_west_ExpendedAmmunition;
    };
    case east: {
        if (isNil "UO_FW_aCount_east_ExpendedAmmunition") then {UO_FW_aCount_east_ExpendedAmmunition = [];};
        _teamvar = UO_FW_aCount_east_ExpendedAmmunition;
    };
    case independent: {
        if (isNil "UO_FW_aCount_INDFOR_ExpendedAmmunition") then {UO_FW_aCount_INDFOR_ExpendedAmmunition = [];};
        _teamvar = UO_FW_aCount_INDFOR_ExpendedAmmunition;
    };
    case civilian: {
        if (isNil "UO_FW_aCount_CIV_ExpendedAmmunition") then {UO_FW_aCount_CIV_ExpendedAmmunition = [];};
        _teamvar = UO_FW_aCount_CIV_ExpendedAmmunition;
    };
};

private _foundClass = _teamvar findIf {(_x select 0) isEqualto _class};
if (_foundClass isEqualto -1) then {
    _teamvar pushBack [_class,1];
} else {
    private _index = (_teamvar select _foundClass);
    _index set [1,(_index select 1) + 1];
};
