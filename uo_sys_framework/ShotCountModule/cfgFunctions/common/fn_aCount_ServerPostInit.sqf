/*	Description: Gives players custom self actions
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		Beta & TinfoilHate & PiZZADOX
 */

#define COMPONENT ShotCount
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

if !(UO_FW_Server_ShotCountModule_Allowed) exitwith {};
if (!(missionNamespace getVariable ["UO_FW_ShotCount_Enabled",false])) exitwith {};

UO_FW_aCount_west_ExpendedAmmunition = [];
UO_FW_aCount_independent_ExpendedAmmunition = [];
UO_FW_aCount_east_ExpendedAmmunition = [];
UO_FW_aCount_civilian_ExpendedAmmunition = [];
UO_FW_aCount_classNames = [];

private _UO_FW_ShotCount_EH_EventId = ["UO_FW_ShotCount_EH_Event", {
	_this params ["_side","_className"];
	private _classDisplay = [_className] call UO_FW_fnc_aCount_getDisplayName;
	[_side,_classDisplay] call UO_FW_fnc_aCount_shotCount;
}] call CBA_fnc_addEventHandler;
