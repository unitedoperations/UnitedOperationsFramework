/*    Description: Adds Shot Count EH
 *    Arguments:
 *         N/A
 *    Return Value:
 *         ARRAY
 *    Author
 *        TinfoilHate & PiZZADOX
 */

#define COMPONENT ShotCount
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(UO_FW_Server_ShotCountModule_Allowed) exitwith {};
if (!GETMVAR(Enabled,false)) exitwith {};
["UO_FW_RegisterModuleEvent", ["Shot Count", "Count shots fired by units", "Beta, TinfoilHate, PiZZADOX and Sacher"]] call CBA_fnc_localEvent;

params ["_obj"];

if !((_obj getVariable [QGVAR(firedEh), ""]) isEqualto "") exitWith {};
_obj setVariable [QGVAR(originalSide),side _obj];

if (_obj isKindOf "Man") then {
    private _firedEHhandle = _obj addEventHandler ["fired", {
        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
        if (isPlayer _unit) then {
            if !(GETPLVAR(ND_Active,false)) then {
                [QGVAR(EH_Event), [side _unit,_magazine]] call CBA_fnc_serverEvent;
            };
        } else {
            [QGVAR(EH_Event), [side _unit,_magazine]] call CBA_fnc_serverEvent;
        };
    }];
    _obj setVariable [QGVAR(firedEh), _firedEHhandle];
};
if (!(_obj isKindOf "Man") && {(_obj isKindOf "LandVehicle") || (_obj isKindOf "Air") || (_obj isKindOf "Ship_F")}) then {
    private _firedEHhandle = _obj addEventHandler ["fired",  {
        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
        [QGVAR(EH_Event), [side _unit,_magazine]] call CBA_fnc_serverEvent;
    }];
    if !(count crew _obj isEqualto 0) then {
        {
            _x setVariable [QGVAR(firedEh), _firedEHhandle];
            _x setVariable [QGVAR(originalSide),(side _obj)];
        } forEach crew _obj;
    };
    _obj setVariable [QGVAR(firedEh), _firedEHhandle];
};
