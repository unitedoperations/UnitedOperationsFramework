/*	Description: Assign a task to a group.
 * 	Arguments:
 * 		NUMBER	- Task Reference
 * 		GROUP	- Group
 * 		NUMBER	- Task Position
 * 		NUMBER	- Task Radius
 * 		NUMBER	- Wait Time at Waypoints
 * 		STRING	- Behaviour
 * 		STRING	- CombatMode
 * 		STRING	- Speed
 * 		STRING	- Formation
 * 	Return Value:
 * 		BOOL 	- True
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)
params [
	["_task",4,[0]],
	["_grp",grpNull,[grpNull]],
	["_pos",[],[[]]],
	["_radius",50,[0]],
	["_wait",3,[0]],
	["_behave","SAFE",[""]],
	["_combat","RED",[""]],
	["_speed","LIMITED",[""]],
	["_formation","WEDGE",[""]],
	["_occupyOption",0,[0]],
	["_bld",objNull,[objNull]],
	["_blds",[],[[]]]
];
	private _taskSet = [_grp,_pos,_radius,_wait,_behave,_combat,_speed,_formation];
	private _taskSetBasic = [_grp,_behave,_combat,_speed,_formation];
	private _taskSetBld = [_bld,_grp,_pos,_radius,_wait,_behave,_combat,_speed,_formation];
	private _taskSetBlds = [_blds,_grp,_pos,_radius,_wait,_behave,_combat,_speed,_formation];
	switch (_task) do {
		default {_taskSet spawn UO_FW_AI_fnc_taskPatrol;};
		case 0: {_taskSetBasic spawn UO_FW_AI_fnc_taskForceHold;}; 	//Hold
		case 1: {_taskSetBasic spawn UO_FW_AI_fnc_taskHoldUntil;}; 	//Hold Until
		case 2: {_taskSet spawn UO_FW_AI_fnc_taskSentry;};				//Sentry
		case 3: {_taskSetBasic spawn UO_FW_AI_fnc_taskPlacement;};		//Stationary
		case 4: {_taskSet spawn UO_FW_AI_fnc_taskPatrol;};				//Patrol
		case 5: {_taskSet spawn UO_FW_AI_fnc_taskPatrolPerimeter;};	//Patrol Perimeter
		case 6: {
			switch (_occupyOption) do {
				case 2: {_taskSetBld spawn UO_FW_AI_fnc_taskMoveNearestBuildingPatrol;};
				case 3: {_taskSetBld spawn UO_FW_AI_fnc_taskMoveRandomBuildingPatrol;};
				case 4: {_taskSetBlds spawn UO_FW_AI_fnc_taskMoveGroupBuildingsPatrol;};
				case 5: {_taskSetBlds spawn UO_FW_AI_fnc_taskMoveRandomGroupBuildingsPatrol;};
				case 6: {_taskSetBlds spawn UO_FW_AI_fnc_taskMoveMultipleBuildingsPatrol;};
				case 7: {_taskSetBlds spawn UO_FW_AI_fnc_taskMoveRandomMultipleBuildingsPatrol;};
				default {_taskSetBld spawn UO_FW_AI_fnc_taskMoveNearestBuildingPatrol;};
			};
		};
		case 7: {
			switch (_occupyOption) do {
				case 2: {_taskSetBld spawn UO_FW_AI_fnc_taskMoveNearestBuildingDefend;};
				case 3: {_taskSetBld spawn UO_FW_AI_fnc_taskMoveRandomBuildingDefend;};
				case 4: {_taskSetBlds spawn UO_FW_AI_fnc_taskMoveGroupBuildingsDefend;};
				case 5: {_taskSetBlds spawn UO_FW_AI_fnc_taskMoveRandomGroupBuildingsDefend;};
				case 6: {_taskSetBlds spawn UO_FW_AI_fnc_taskMoveMultipleBuildingsDefend;};
				case 7: {_taskSetBlds spawn UO_FW_AI_fnc_taskMoveRandomMultipleBuildingsDefend;};
				default {_taskSetBld spawn UO_FW_AI_fnc_taskMoveNearestBuildingDefend;};
			};
		};
		case 8: {_taskSet spawn {};};	//Entrenched
		case 9: {_taskSet spawn {};};	//Reinforcements
	};
	true
