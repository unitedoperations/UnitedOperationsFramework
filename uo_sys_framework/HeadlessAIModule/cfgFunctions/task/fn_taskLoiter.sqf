/*	Description: Task a group to loiter in position
 * 	Arguments:
 * 		GROUP	- Group
 * 	Optional:
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
	"_grp",
	"_pos",
	["_radius",30,[0]],
	["_wait",3,[0]],
	["_behave","SAFE",[""]],
	["_combat","RED",[""]],
	["_speed","LIMITED",[""]],
	["_formation","WEDGE",[""]],
	["_type","MOVE",[""]],
	["_oncomplete","this call UO_FW_AI_fnc_taskSearchNearby",[""]],
	["_compradius",0,[0]],
	["_wpcount",10,[0]],
	"_i"
];
{_x forcespeed -1; _x enableAI "PATH";} foreach units _grp;

//We need a list of actions that the AI can do for loitering.
private _UnitArray = units _grp;
{
	if (_x isEqualTo (vehicle _x)) then
	{
		//Each AI will need to join their own group. The plan is to make them re-form when combat starts.
		//[_x] joinsilent grpnull;
		//(group _x) setVariable ["UO_FW_AI_Mission","LOITERING"];
		_x setVariable ["UO_FW_AI_LOITERINGACT",0];
		[_x,_UnitArray] spawn UO_FW_AI_fnc_LoiterAction;
	};
} foreach _UnitArray;
_grp setvariable ["InitialWPSet",true];
_grp setVariable ["UO_FW_AI_Mission","LOITERING"];
true
