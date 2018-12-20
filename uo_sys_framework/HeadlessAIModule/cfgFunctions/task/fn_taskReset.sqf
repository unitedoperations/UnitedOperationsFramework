/*	Description: Reset Group ready for a new Task.
 * 	Arguments:
 * 		GROUP	- Group
 * Example:
 * 		_grp call UO_FW_AI_fnc_taskReset;
 *	Author:
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
	[_this] call CBA_fnc_clearWaypoints;
	{
		_x enableAI "PATH";
		_x doFollow leader _this;
		_x setvariable["UO_FW_Occupy",false];
		_x setvariable["UO_FW_OccupiedBuilding",objNull];
	} forEach (units _this);	
	true