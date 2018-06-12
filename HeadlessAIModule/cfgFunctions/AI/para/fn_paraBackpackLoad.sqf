/* 	Description: Restore Players backpack and backpack contents from save.
 * 	Arguments:
 * 		NIL		- Nil
 * 	Return Value:
 *		BOOL 	- True
 */
	waitUntil {sleep 2; ((getPosATL player) select 2) < 2;};
	(player getVariable ["aeBackpack",["",[]]]) params [["_bkp","",[""]],["_bkpc",[],[[]]]];
	removeBackpackGlobal player;
	player addBackpack _bkp;
	{
		player addItemToBackpack _x;
	} forEach _bkpc;	
	true