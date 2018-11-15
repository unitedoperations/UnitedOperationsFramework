/*	Description: Check stance of player is allowed.
 * 	Arguments:
 *		OBJECT	- Unit
 * 		ARRAY 	- Allowed Stance
 * 	Return Value:
 *		BOOL 	- True or False
 */
params [
	["_unit",objNull,[objNull]],
	["_allowed",[],[[]]],
	["_return",false,[false]]
];
	if (count _allowed > 0) then {
		if((stance _unit) in _allowed) then {
			_return	= false;
		} else {
			_return	= true;
		};
	};
	_return
