#define COMPONENT DisconnectControl
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_unit"];
if ((EGETVAR(_unit,Core,Tracked,false)) && {((side _unit) in GVAR(Sides))}) then {
    private _delay = (GETMVAR(Time,2));
    [{
        params ["_unit"];
        deleteVehicle _unit;
    }, [_unit], _delay] call CBA_fnc_waitAndExecute;
};
