/*	Description: Activate the task when the zone is activated.
 * 	Arguments:
 * 		ARRAY	- Units and Unit Settings
 * 		ARRAY	- Group Vehicles and Group Vehicle Settings
 * 	Return Value:
 * 		GROUP 	- Created Group
 *	Author
 *		suits & PiZZADOX
 */
 #include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
 UO_FW_AI_EXEC_CHECK(SERVERHC)
	{
		_task = _x;
		{
			_grp = _x;
			_grp setVariable["UO_FW_isNotZoneActivated",false];
			_grp setVariable["UO_FW_CurrentTaskEndTime",time - 1];
			[_grp,_task] call UO_FW_AI_fnc_taskSet;
		} forEach (_task getVariable ["UO_FW_taskGroups", []]);
	} forEach _this;
	true
