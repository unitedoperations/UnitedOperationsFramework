#define COMPONENT DisconnectControl
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_unit"];

if ((_unit getVariable ["UO_FW_Tracked", false]) && {((side _unit) in disconnect_control_sides)}) then {
	private _delay = (missionNamespace getVariable ["UO_FW_DisconnectControl_Time",2]);
    [{
		params ["_unit"];
		deleteVehicle _unit;
	}, [_unit], _delay] call CBA_fnc_waitAndExecute;
};
