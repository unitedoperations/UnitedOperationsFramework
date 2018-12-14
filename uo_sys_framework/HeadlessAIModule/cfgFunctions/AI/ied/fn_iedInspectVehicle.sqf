/*	Description: Check players EOD skill level and adjust interact time and chance.
 * 	Arguments:
 *		OBJECT	- Unit
 *		OBJECT	- Target Object
 * 	Return Value:
 *		ARRAY
 *			NUMBER	- Interact Time
 *			NUMBER	- Skill / Chance of Failure
 */
params [
	"_unit", 
	"_target",
	["_actionIndex", 0, [0]],
	["_actionName",	"", [""]],
	["_message", "", [""]],
	["_canExplodeOnFail", false, [false]],
	["_explodeIfOrderWrong", false, [false]],
	["_forceExplode", false, [false]],
	["_actionTime", 7, [7]]
];
	private _animation = [(stance _unit)] call UO_AI_fnc_iedActionAnimation;
	if (!_canExplodeOnFail) then {
		[_unit, _animation, 1] call ace_common_fnc_doAnimation;
		[_actionTime,[_unit, _target, _actionIndex,_canExplodeOnFail, _message, _forceExplode, _explodeIfOrderWrong],{(_this select 0) spawn UO_AI_fnc_iedActionUpdate},{},_actionName] call ace_common_fnc_progressBar;
	} else {
		if(!(_ied getVariable ["UO_FW_defused", false])) then {
			[_target,_unit] spawn UO_AI_fnc_iedDetonate;
		};
	};	
	true