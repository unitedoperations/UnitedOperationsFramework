/*	Description: Gives AI Driver actions to vehicle
 *	Arguments:
 * 		OBJECT - vehicle
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		BlackHawk & PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL)

params ["_veh"];

//AI driver action
private _action = ["ai_driver","Add/Remove AI driver","",{
    [_target, _player] call UO_FW_fnc_aidriverstoggle;
},
{
    vehicle _player == _target && ((assignedVehicleRole _player) select 0) == "Turret" && UO_FW_AiDriverVehicle in [objNull, vehicle _player]
}] call ace_interact_menu_fnc_createAction;

//unflip action
private _unflipAction = ["ai_driver_unflip","Unflip vehicle","",{
    [_target, surfaceNormal position _target] remoteExec ["setVectorUp", 2, false];
    _target setPos [getpos _target select 0, getpos _target select 1, (getpos _target select 2) + 2];
},
{
    vehicle _player == _target && ((assignedVehicleRole _player) select 0) == "Turret" && (vectorUp _target) select 2 < 0
}] call ace_interact_menu_fnc_createAction;

//PIP action
private _pipAction = ["ai_driver_pip","Enable/Disable driver's view","",{
    (isNil "UO_FW_driverCam" || {isNull UO_FW_driverCam}) call UO_FW_fnc_aiDriverstoggleDriverCam;
},
{
    vehicle _player == _target && ((assignedVehicleRole _player) select 0) == "Turret" && !isNull (_target getVariable ["UO_FW_aidrivers_driver", objNull])
}] call ace_interact_menu_fnc_createAction;

//toggle NV for PIP
private _pipNvAction = ["ai_driver_pip_nv","Enable/Disable NV in driver's view","",{
	if (isNil "UO_FW_pipNvEnabled") then {
		UO_FW_pipNvEnabled = false;
	};
	"UO_FW_rtt" setPiPEffect ([[1], [0]] select UO_FW_pipNvEnabled);
	UO_FW_pipNvEnabled = !UO_FW_pipNvEnabled;
},
{
	vehicle _player == _target &&
	((assignedVehicleRole _player) select 0) == "Turret" &&
	(!isNil "UO_FW_driverCam" && {!isNull UO_FW_driverCam})
}] call ace_interact_menu_fnc_createAction;

[_veh, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
[_veh, 1, ["ACE_SelfActions"], _pipAction] call ace_interact_menu_fnc_addActionToObject;

if (UO_FW_AIDrivers_FlipEnabled) then {
	[_veh, 1, ["ACE_SelfActions"], _unflipAction] call ace_interact_menu_fnc_addActionToObject;
};
	
if (UO_FW_AIDrivers_NVEnabled) then {
	[_veh, 1, ["ACE_SelfActions"], _pipNvAction] call ace_interact_menu_fnc_addActionToObject;
};
