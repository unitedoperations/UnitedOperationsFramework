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

private ["_UO_FW_ShotCount_textBLU","_UO_FW_ShotCount_textOPF","_UO_FW_ShotCount_textIND","_UO_FW_ShotCount_textCIV"];

if !(UO_FW_ShotCount_ExpendedAmmunition_BLUFOR isEqualto []) then {
    _UO_FW_ShotCount_textBLU = "BLUFOR Munitions Expended:<br/>";
    {
        _x params ["_label","_count"];
        _UO_FW_ShotCount_textBLU = _UO_FW_ShotCount_textBLU + _label + ": " + str(_count) + " Rounds" + "<br/>";
    } foreach UO_FW_ShotCount_ExpendedAmmunition_BLUFOR;
} else {
    _UO_FW_ShotCount_textBLU = "";
};

if !(UO_FW_ShotCount_ExpendedAmmunition_OPFOR isEqualto []) then {
    _UO_FW_ShotCount_textOPF = "OPFOR Munitions Expended:<br/>";
    {
        _x params ["_label","_count"];
        _UO_FW_ShotCount_textOPF = _UO_FW_ShotCount_textOPF + _label + ": " + str(_count) + " Rounds" + "<br/>";
    } foreach UO_FW_ShotCount_ExpendedAmmunition_OPFOR;
} else {
    _UO_FW_ShotCount_textOPF = "";
};

if !(UO_FW_ShotCount_ExpendedAmmunition_INDFOR isEqualto []) then {
    _UO_FW_ShotCount_textIND = "INDEPENDENT Munitions Expended:<br/>";
    {
        _x params ["_label","_count"];
        _UO_FW_ShotCount_textIND = _UO_FW_ShotCount_textIND + _label + ": " + str(_count) + " Rounds" + "<br/>";
    } foreach UO_FW_ShotCount_ExpendedAmmunition_INDFOR;
} else {
    _UO_FW_ShotCount_textIND = "";
};

if !(UO_FW_ShotCount_ExpendedAmmunition_CIV isEqualto []) then {
    _UO_FW_ShotCount_textCIV = "CIVILIAN Munitions Expended:<br/>";
    {
        _x params ["_label","_count"];
        _UO_FW_ShotCount_textCIV = _UO_FW_ShotCount_textCIV + _label + ": " + str(_count) + " Rounds" + "<br/>";
    } foreach UO_FW_ShotCount_ExpendedAmmunition_CIV;
} else {
    _UO_FW_ShotCount_textCIV = "";
};

["UO_FW_ShotCount_Display_Event", [_UO_FW_ShotCount_textBLU,_UO_FW_ShotCount_textOPF,_UO_FW_ShotCount_textIND,_UO_FW_ShotCount_textCIV]] call CBA_fnc_globalEvent;
