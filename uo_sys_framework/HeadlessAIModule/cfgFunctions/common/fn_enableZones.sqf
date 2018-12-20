/*	Description: Enable zones that have been suspended.
 * 	Arguments:
 * 		ARRAY	- Zone Names
 * 	Return Value:
 * 		BOOL	- true
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)

	private _zones = [];
	if ((_this select 0) isEqualType []) then {
		_zones = _this select 0;
	} else {
		_zones = _this;
	};
	{
		([_x,UO_FW_AI_Zones] call UO_FW_AI_fnc_getDetails) set [3, 0];
	} forEach _zones;
	true
