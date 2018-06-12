/*	Description: Set the smoke deployment on para drop.
 *	Arguments:
 *		NIL
 *	Return Value:
 *		BOOL - True
 */
params [["_u",objNull,[objNull]],["_s",objNull,[objNull]],["_smoke",false,[false]]]; 
	if(_smoke) then {
		_s setVariable["aeParaSmoke",false,true];
		hint 'Para Drop Smoke Off';
	} else {
		_s setVariable["aeParaSmoke",true,true];
		hint 'Para Drop Smoke Enabled';
	};
	publicVariable 'aeParaSmoke';      
	true