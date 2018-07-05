/*	Description: Returns the animation for IED actions based on stance.
 * 	Arguments:
 *		STRING	- Stance
 * 	Return Value:
 *		STRING 	- Animation
 */
	private["_stance","_return"];
	_stance		= [_this,0,"STAND",[""]] call BIS_fnc_param;
	_return		= "";	
	switch (_stance) do {
		case "PRONE": { _return = "AinvPpneMstpSlayWrflDnon_medicOther"; };
		case "CROUCH": { _return = "AinvPknlMstpSnonWnonDnon_medic1"; };
		case "STAND": { _return	= "AinvPknlMstpSnonWnonDnon_medic1"; };
		default {_return = "";};
	};	
	_return
