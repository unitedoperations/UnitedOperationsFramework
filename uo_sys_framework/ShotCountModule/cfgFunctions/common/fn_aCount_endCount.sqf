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

private ["_ShotCount_textBLU","_ShotCount_textOPF","_ShotCount_textIND","_ShotCount_textCIV"];

if !(UO_FW_ShotCount_ExpendedAmmunition_BLUFOR isEqualto []) then {
    _ShotCount_textBLU = "BLUFOR Munitions Expended:<br/>";
    {
        _x params ["_label","_count"];
        _ShotCount_textBLU = _ShotCount_textBLU + _label + ": " + str(_count) + " Rounds" + "<br/>";
    } foreach UO_FW_ShotCount_ExpendedAmmunition_BLUFOR;
} else {
    _ShotCount_textBLU = "";
};

if !(UO_FW_ShotCount_ExpendedAmmunition_OPFOR isEqualto []) then {
    _ShotCount_textOPF = "OPFOR Munitions Expended:<br/>";
    {
        _x params ["_label","_count"];
        _ShotCount_textOPF = _ShotCount_textOPF + _label + ": " + str(_count) + " Rounds" + "<br/>";
    } foreach UO_FW_ShotCount_ExpendedAmmunition_OPFOR;
} else {
    _ShotCount_textOPF = "";
};

if !(UO_FW_ShotCount_ExpendedAmmunition_INDFOR isEqualto []) then {
    _ShotCount_textIND = "INDEPENDENT Munitions Expended:<br/>";
    {
        _x params ["_label","_count"];
        _ShotCount_textIND = _ShotCount_textIND + _label + ": " + str(_count) + " Rounds" + "<br/>";
    } foreach UO_FW_ShotCount_ExpendedAmmunition_INDFOR;
} else {
    _ShotCount_textIND = "";
};

if !(UO_FW_ShotCount_ExpendedAmmunition_CIV isEqualto []) then {
    _ShotCount_textCIV = "CIVILIAN Munitions Expended:<br/>";
    {
        _x params ["_label","_count"];
        _ShotCount_textCIV = _ShotCount_textCIV + _label + ": " + str(_count) + " Rounds" + "<br/>";
    } foreach UO_FW_ShotCount_ExpendedAmmunition_CIV;
} else {
    _ShotCount_textCIV = "";
};

["UO_FW_ShotCount_Display_Event", [_ShotCount_textBLU,_ShotCount_textOPF,_ShotCount_textIND,_ShotCount_textCIV]] call CBA_fnc_globalEvent;
