/*	Description: Delete IED/pressure plates, remove from detection arrays.
 * 	Arguments:
 *		OBJECT	- IED or pressure plate.
 * 	Return Value:
 *		BOOL 	- True or False
 */
params ["_target"];
	deleteVehicle (_target getVariable ["UO_FW_flagmarker",objNull]);
	UO_FW_ieds deleteAt ([_target,UO_FW_ieds] call UO_AI_fnc_getDetailsArray);	
	{ 
		UO_FW_ieds deleteAt ([_x,UO_FW_ieds] call UO_AI_fnc_getDetailsArray);
		deleteVehicle _x;		
	} foreach (_target getVariable ["UO_FW_pp",[]]);	
	if( _target getVariable ["UO_FW_yield", 0] == 5 && !isNull (_target getVariable ['UO_FW_iedmodule',objNull]) ) then {
		sleep 5;
		(_target getVariable ['UO_FW_iedmodule',objNull]) spawn UO_AI_fnc_iedCreate;
	};
	deleteVehicle _target;
	publicVariable 'UO_FW_ieds';
	true