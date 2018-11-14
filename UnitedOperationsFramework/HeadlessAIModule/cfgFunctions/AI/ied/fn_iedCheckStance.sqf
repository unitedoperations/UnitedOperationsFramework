/*	Description: Check stance of player, detonate IED of wrong stance.
 * 	Arguments:
 *		OBJECT	- Unit
 *		OBJECT	- Target Object
 * 		ARRAY 	- Allowed Stance
 *		NUMBER 	- Activation Delay
 * 	Return Value:
 *		BOOL 	- True or False
 */
params [
	["_unit",objNull,[objNull]],
	["_target",objNull,[objNull]],
	["_allowed",[],[[]]],
	["_return",false,[false]]
];
	if (count _allowed > 0) then {
		if((stance _unit) in _allowed) then {
			_return	= true;
		} else {
			if(!(_target getVariable ["UO_FW_defused", false])) then {
				[_target,_unit] spawn UO_AI_fnc_iedDetonate;
			};
		};
	};
	_return
