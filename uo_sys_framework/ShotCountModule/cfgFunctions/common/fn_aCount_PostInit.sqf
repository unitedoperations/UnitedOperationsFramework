/*	Description: Gives players custom self actions
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		Beta & TinfoilHate & PiZZADOX
 */

#define COMPONENT ShotCount
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(UO_FW_Server_ShotCountModule_Allowed) exitwith {};
if (!(missionNamespace getVariable ["UO_FW_ShotCount_Enabled",false])) exitwith {};
["Shot Count", "Count shots fired by units", "Beta, TinfoilHate, PiZZADOX and Sacher"] call UO_FW_fnc_RegisterModule;

private _UO_FW_aCount_ShotDisplay_Event = ["UO_FW_aCount_ShotDisplay_Event", {
	if !(hasInterface) exitwith {};
	diag_log format ["UO_FW_aCount_ShotDisplay_Event published with: %1",_this];
	[{!((uiNamespace getVariable ["UO_FW_EndScreen",""]) isEqualto "")}, {
		diag_log format ["UO_FW_EndScreen var: %1",(uiNamespace getVariable ["UO_FW_EndScreen",""])];
		_this params ["_textBLU","_textOPF","_textIND","_textCIV"];
		private _endscreenDiag = (uiNamespace getVariable "UO_FW_EndScreen");
		private _bottomLeft = 3004;
		private _bottomMiddleLeft = 3005;
		private _bottomMiddleRight = 3006;
		private _bottomRight = 3007;
		(_endscreenDiag displayCtrl _bottomLeft) ctrlSetStructuredText parseText _textBLU;
		(_endscreenDiag displayCtrl _bottomMiddleLeft) ctrlSetStructuredText parseText _textOPF;
		(_endscreenDiag displayCtrl _bottomMiddleRight) ctrlSetStructuredText parseText _textIND;
		(_endscreenDiag displayCtrl _bottomRight) ctrlSetStructuredText parseText _textCIV;
	}, _this] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
