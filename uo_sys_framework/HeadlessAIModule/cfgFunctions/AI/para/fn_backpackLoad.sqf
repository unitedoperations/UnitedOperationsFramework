/* 	Restore Players backpack and backpack contents from save.
 * 	Arguments:
 * 		PLAYER	- Target Unit
 * 	Return Value:
 *		BOOL 	- True
 */
if(!isServer) exitWith{};
	params [["_unit",objNull,[objNull]],"_backpackArray","_backpack","_backpackContents"];
	_backpackArray		= _unit getVariable ["unitBackpack", ["",[]] ];
	_backpackArray params [["_backpack","",[""]],["_backpackContents",[],[[]]]];
	removeBackpackGlobal  _unit;
	_unit addBackpack _backpack;
	{
		_unit addItemToBackpack _x;
	} forEach _backpackContents;	
	true