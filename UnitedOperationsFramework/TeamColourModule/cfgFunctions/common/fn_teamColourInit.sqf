/*	Description: Checks Team Colour setting and sets game team selection once in game
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		Olsen & PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
if(!UO_FW_SERVER_TEAMCOLOURMODULE_ALLOWED) exitWith {};
if (!isDedicated) then {
	
	"" spawn {
		
		private ["_color"];
		
		_colour = player getVariable ["UO_FW_TeamColour", "NONE"];
		
		sleep 0.01;
		
		if (_colour != "NONE") then {
			
			["CBA_teamColorChanged", [player, _colour]] call CBA_fnc_globalEvent;
			
			player setVariable ["UO_FW_TeamColour", nil, false];
			
		};
		
	};
	
};