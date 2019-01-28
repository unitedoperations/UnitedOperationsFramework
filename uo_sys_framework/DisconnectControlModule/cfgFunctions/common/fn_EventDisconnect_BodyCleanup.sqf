#define COMPONENT DisconnectControl
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_unit"];
if ((GETVAR(_unit,Tracked,false)) && {((side _unit) in UO_FW_Disconnect_Control_Sides)}) then {
    private _delay = (GETMVAR(DisconnectControl_Time,2));
    [{
        params ["_unit"];
        deleteVehicle _unit;
    }, [_unit], _delay] call CBA_fnc_waitAndExecute;
};
