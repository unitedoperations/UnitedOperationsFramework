/*	Description: Enable zones that have been suspended.
 * 	Arguments:
 * 		ARRAY	- Zone Names
 * 	Return Value:
 * 		BOOL	- true
 *	Author
 *		suits & PiZZADOX
 */
if(!isServer) exitWith {_this remoteExec ["UO_AI_fnc_enableZones", 2];};
	private _zones = [];
	if ((_this select 0) isEqualType []) then {
		_zones = _this select 0;
	} else {
		_zones = _this; 
	};	
	{
		([_x,UO_FW_zones] call UO_AI_fnc_getDetails) set [3, 0];
	} forEach _zones;
	true