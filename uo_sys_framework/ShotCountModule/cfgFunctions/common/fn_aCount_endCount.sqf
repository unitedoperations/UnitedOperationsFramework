/*    Description: Calculate End Screen Count
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

private ["_UO_FW_aCount_textBLU","_UO_FW_aCount_textOPF","_UO_FW_aCount_textIND","_UO_FW_aCount_textCIV"];

if !(UO_FW_aCount_west_ExpendedAmmunition isEqualto []) then {
    _UO_FW_aCount_textBLU = "BLUFOR Munitions Expended:<br/>";
    {
        _x params ["_label","_count"];
        _UO_FW_aCount_textBLU = _UO_FW_aCount_textBLU + _label + ": " + str(_count) + " Rounds" + "<br/>";
    } foreach UO_FW_aCount_west_ExpendedAmmunition;
} else {
    _UO_FW_aCount_textBLU = "";
};

if !(UO_FW_aCount_east_ExpendedAmmunition isEqualto []) then {
    _UO_FW_aCount_textOPF = "OPFOR Munitions Expended:<br/>";
    {
        _x params ["_label","_count"];
        _UO_FW_aCount_textOPF = _UO_FW_aCount_textOPF + _label + ": " + str(_count) + " Rounds" + "<br/>";
    } foreach UO_FW_aCount_east_ExpendedAmmunition;
} else {
    _UO_FW_aCount_textOPF = "";
};

if !(UO_FW_aCount_INDFOR_ExpendedAmmunition isEqualto []) then {
    _UO_FW_aCount_textIND = "INDEPENDENT Munitions Expended:<br/>";
    {
        _x params ["_label","_count"];
        _UO_FW_aCount_textIND = _UO_FW_aCount_textIND + _label + ": " + str(_count) + " Rounds" + "<br/>";
    } foreach UO_FW_aCount_INDFOR_ExpendedAmmunition;
} else {
    _UO_FW_aCount_textIND = "";
};

if !(UO_FW_aCount_CIV_ExpendedAmmunition isEqualto []) then {
    _UO_FW_aCount_textCIV = "CIVILIAN Munitions Expended:<br/>";
    {
        _x params ["_label","_count"];
        _UO_FW_aCount_textCIV = _UO_FW_aCount_textCIV + _label + ": " + str(_count) + " Rounds" + "<br/>";
    } foreach UO_FW_aCount_CIV_ExpendedAmmunition;
} else {
    _UO_FW_aCount_textCIV = "";
};

["UO_FW_aCount_ShotDisplay_Event", [_UO_FW_aCount_textBLU,_UO_FW_aCount_textOPF,_UO_FW_aCount_textIND,_UO_FW_aCount_textCIV]] call CBA_fnc_globalEvent;
