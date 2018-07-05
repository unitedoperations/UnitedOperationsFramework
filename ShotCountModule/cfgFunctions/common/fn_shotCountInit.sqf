/*	Description: Gives players custom self actions 
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		Beta & TinfoilHate & PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL)

if (!UO_FW_ShotCount_Enable) exitwith {};

if (isServer) then
{
	aCount_west_ExpendedAmmunition = [];
	aCount_resistance_ExpendedAmmunition = [];
	aCount_east_ExpendedAmmunition = [];
	aCount_civilian_ExpendedAmmunition = [];
	aCount_classNames = [];
	
	_AllUnitsAndVehs = entities [["Man","Land","Air","Ship"], [], true, false];
	
	[{ time > 0.1 }, {
		{ _x call UO_FW_fnc_aCountaddEH; } forEach _AllUnitsAndVehs;
	}] call CBA_fnc_waitUntilAndExecute;
	
	["aCount_event_addEH",UO_FW_fnc_aCountaddEH] call CBA_fnc_addEventHandler;
};

if (!isDedicated && hasInterface) then
{
	if (didJIP) then {
		[{(!isNull player) && (time > 0.1)}, {
			["aCount_event_addEH", player] call CBA_fnc_serverEvent;
		}] call CBA_fnc_waitUntilAndExecute;
	};

	["aCount_event_scoreScreen",UO_FW_fnc_aCountshotDisplay] call CBA_fnc_addEventHandler;
};
