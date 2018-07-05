/*	Description: Sets players to be a Combatant or Non-Combatant.
 *	Arguments:
 * 		BOOL	- Combatant (FALSE) Non-Combatant (TRUE)
 * 	Return Value:
 * 		BOOL	- True
 *	Author:
 *		suits & PiZZADOX
 */
if(!hasInterface) exitWith {};
	params [["_c",false,[false]]];
	[_c, {player setCaptive _this;}] remoteExec ["bis_fnc_call", 0];
	true