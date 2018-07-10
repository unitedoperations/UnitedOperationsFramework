/*	Description: Adds Shot Count EH
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		TinfoilHate
 */

_obj = param [0];

_obj setVariable ["aCount_originalSide",side _obj,false];

if (_obj isKindOf "Man") then
{
	_obj addEventHandler ["fired", {[side ( _this select 0),(_this select 5) call UO_FW_fnc_aCountgetDisplayName] call UO_FW_fnc_aCountshotCount;}];
	_obj setVariable ["aCount_firedEh", true, false];
};

if (((_obj isKindOf "Land") && !(_obj isKindOf "Man")) || (_obj isKindOf "Air") || (_obj isKindOf "Ship")) then
{
	if (count crew _obj > 0) then
		{
		{
			_x setVariable ["aCount_firedEh", true, false];
			_x setVariable ["aCount_originalSide",side _obj,false];
		} forEach crew _obj;
	};

	_obj addEventHandler ["fired", {[side ( _this select 0),(_this select 5) call UO_FW_fnc_aCountgetDisplayName] call UO_FW_fnc_aCountshotCount;}];
	_obj setVariable ["aCount_firedEh", true, false];
};