/*	Saves backpack and backpack contents to player.
 * 	Arguments:
 * 		PLAYER	- Target Unit
 * 	Return Value:
 *		BOOL 	- True
 */

	private["_unit","_backpackContents","_backpack","_backpackArray"];
	params [["_unit",objNull,[objNull]]];
	_backpackContents	= backpackItems _unit;
	_backpack 			= backpack _unit;
	if (isNil '_backpackContents') then {_backpackContents = [];};
	if (isNil '_backpack') then {_backpack = "";};
	_backpackArray		= [_backpack,_backpackContents];
	_unit setVariable ["unitBackpack", _backpackArray, false];
	true
