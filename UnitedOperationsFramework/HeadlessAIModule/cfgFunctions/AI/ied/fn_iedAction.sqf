/*	Description: Checks if player can perform action on item.
 * 	Arguments:
 *		OBJECT	- Unit
 *		OBJECT	- Target Object
 *		NUMBER	- Index of action being performed
 *		STRING 	- Name - Text to show in the progress bar
 *		STRING 	- Message - Message to show (hint) when action is complete
 *		BOOL	- Needs Skill - Can explode due to insufficient skill (or bad luck).
 *		BOOL	- Will always explode
 *		BOOL	- Explode if wrong order
 * 	Return Value:
 *		BOOL 	- True or False
 *	Example:
 *  [_player,_target, 2, 'Bypassing Circuit Power'] call UO_AI_fnc_iedAction
 *  [_player,_target, 2, 'Attempting to Disable Pressure Plate', '', false, true] call UO_AI_fnc_iedAction
 */
params [
	"_unit", 
	"_target", 
	["_actionIndex", 0, [0]],
	["_actionName",	"", [""]],  
	["_message", "", [""]],
	["_canExplodeOnFail", true, [false]],
	["_explodeIfOrderWrong", true, [false]],
	["_forceExplode", false, [false]]
];
	private _animation = [(stance _unit)] call UO_AI_fnc_iedActionAnimation;
	([_unit,_target,_canExplodeOnFail] call UO_AI_fnc_iedActionTimeAndSkill) params ["_time", "_skill"];	
	if (!_canExplodeOnFail || (_skill > 3)) then {
		[_unit, _animation, 1] call ace_common_fnc_doAnimation;
		[_time,[_unit, _target, _actionIndex,_canExplodeOnFail, _message, _forceExplode, _explodeIfOrderWrong],{(_this select 0) spawn UO_AI_fnc_iedActionUpdate},{},_actionName] call ace_common_fnc_progressBar;
	} else {
		if(!(_ied getVariable ["UO_FW_defused", false])) then {
			[_target,_unit] spawn UO_AI_fnc_iedDetonate;
		};
	};	
	true