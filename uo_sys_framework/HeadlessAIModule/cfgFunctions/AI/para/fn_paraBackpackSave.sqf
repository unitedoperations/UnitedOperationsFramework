/*	Description: Save unit backpack on para drop.
 * 	Arguments:
 * 		NIL		- Nil
 * 	Return:
 *		BOOL 	- True
 */
	player setVariable ["aeBackpack", [(backpack player),(backpackItems player)]];	
	true