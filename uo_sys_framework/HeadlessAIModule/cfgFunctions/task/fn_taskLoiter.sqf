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
UO_FW_AI_EXEC_CHECK(SERVERHC);

params [
	"_grp",
	"_pos",
	["_radius",30,[0]],
	["_wait",3,[0]],
	["_behaviour", "UNCHANGED", [""]],
  ["_combat", "NO CHANGE", [""]],
  ["_speed", "UNCHANGED", [""]],
	["_formation", "NO CHANGE", [""]]
];

{_x forcespeed -1; _x enableAI "PATH";} foreach units _grp;
_grp setvariable ["InitialWPSet",true];
_grp setVariable ["UO_FW_AI_Mission","LOITERING"];

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
true
