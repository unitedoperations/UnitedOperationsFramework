/*	Description: Remove selected variable type from array if present, pass variables to waypoint creation.
 * 	Arguments:
 *		NUMBER	- Array Selection to Remove
 * 		STRING	- Type Name of Variable to Remove
 * 		NUMBER	- Selection to Add to Array
 *		ANY		- Variable to Add to Array
 *		ARRAY	- Array to Modify
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
if(!UO_FW_var_isHCorServer) exitWith {};
params[["_s",0,[0]],["_t","OBJECT",[""]],["_a",1,[0]],"_var",["_array",[],[[]]]];
	if(typename(_array select _s) == _t ) then {
		_array deleteAt 0;
	};
	_array set [_a,_var];
	_array set [2,0];
	private _wp = _array call UO_AI_fnc_createWaypoint;
	true