/*	Description: Calculate End Screen Count
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		TinfoilHate
 */

_munitionsBLU = aCount_west_ExpendedAmmunition;
_munitionsOPF = aCount_east_ExpendedAmmunition;
_munitionsRES = aCount_resistance_ExpendedAmmunition;
_munitionsCIV = aCount_civilian_ExpendedAmmunition;

["aCount_event_scoreScreen", [_munitionsBLU,_munitionsOPF,_munitionsRES,_munitionsCIV]] call CBA_fnc_globalEvent;