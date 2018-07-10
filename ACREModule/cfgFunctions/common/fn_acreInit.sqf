/*	Description: Checks ACRE module values and sets options accordingly
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT)

if (!UO_FW_ACRE_SETTINGS_ENABLED) exitwith {};

[] spawn {

	_colour = player getVariable ["UO_FW_TeamColour", "NONE"];
	
	waituntil {!isNull player};
	sleep 0.01;
	
	if (_colour != "NONE") then {
		
		["CBA_teamColorChanged", [player, _colour]] call CBA_fnc_globalEvent;
		
		player setVariable ["UO_FW_TeamColour", nil, false];
		
	};
	
};
	