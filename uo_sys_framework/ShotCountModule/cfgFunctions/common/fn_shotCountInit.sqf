/*	Description: Gives players custom self actions
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		Beta & TinfoilHate & PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"


if (!(missionNamespace getVariable ["UO_FW_ShotCount_Enabled",false])) exitwith {};
["Shot Count", "Count shots fired by units", "Sacher"] call UO_FW_FNC_RegisterModule;
if (isServer) then
{
	aCount_west_ExpendedAmmunition = [];
	aCount_resistance_ExpendedAmmunition = [];
	aCount_east_ExpendedAmmunition = [];
	aCount_civilian_ExpendedAmmunition = [];
	aCount_classNames = [];

	[{ time > 0.1 }, {
		{ _x call UO_FW_fnc_aCount_addEH; } forEach allMissionObjects "All";
	}] call CBA_fnc_waitUntilAndExecute;

	["UO_FW_aCount_event_addEH",UO_FW_fnc_aCount_addEH] call CBA_fnc_addEventHandler;
};

if (!isDedicated && hasInterface) then
{
	if (didJIP) then {
		[{(!isNull player) && (time > 0.1)}, {
			["UO_FW_aCount_event_addEH", player] call CBA_fnc_serverEvent;
		}] call CBA_fnc_waitUntilAndExecute;
	};
};
