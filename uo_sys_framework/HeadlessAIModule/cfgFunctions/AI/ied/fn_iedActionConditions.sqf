/*	Description: Checks if player can perform action on item.
 * 	Arguments:
 *		OBJECT	- Unit
 *		OBJECT	- Target Object
 *		NUMBER	- Action Index
 *		BOOL 	- Requires Tool (Default true)
 *		NUMBER	- Required Action (Action that must be performed to make this action visible) (Default -1 (none))
 * 		[STRING]- Array of allowed stances (default ["PRONE"])
 *		CODE	- Check Condition 1 (Optional)
 *		CODE	- Check Condition 2 (Optional)

 * 	Return Value:
 *		BOOL 	- True or False
 *	Example:
 *  [_unit,_target,_actionIndex,[_allowedStances],{_actionCondition},_requiresTool] call UO_AI_fnc_iedActionConditions;
 *  [_unit,_target,["PRONE","CROUCH"],{_target getVariable ['UO_FW_investigated', false];},true] call UO_AI_fnc_iedActionConditions;
 *  [_player,_target,0,false,-1, ['PRONE','CROUCH','STAND']
 */
params [
	["_unit", objNull, [objNull]],
	["_target", objNull, [objNull]],
	["_actionIndex", 0, [0]],
	["_requiresTool", false, [false]], 
	["_requiredAction", -1, [0]], 
	["_requiredStances", ["PRONE"], [[]]], 
	["_cond1", {true}, [{}]], 
	["_cond2", {true}, [{}]],
	["_equip", "ACE_DefusalKit", [""]]
];
	private _actions = _target call UO_AI_fnc_iedActionStates;
	private _check1	= ((_equip in (items _unit)) || !(_requiresTool));
	private _check2	= [_unit,_target,_requiredStances] call UO_AI_fnc_iedCheckStance;
	private _check3	= (_target call _cond1);
	private _check4	= (_target call _cond2);
	private _check5 = !(_actions select _actionIndex) && { if(_requiredAction > -1) then { _actions select _requiredAction } else { true } };
	_check1 && _check2 && _check3 && _check4 && _check5