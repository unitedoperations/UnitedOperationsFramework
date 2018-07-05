/*	Description: Remove IED Pressure Plate when defused.
 * 	Arguments:
 *		OBJECT	- Unit and Target
 * 	Return Value:
 *		BOOL 	- True or False
 */
if(!isServer) exitWith { _this remoteExec ["UO_AI_fnc_iedRemovePP", 2]; };
params ["_target"];
	if((typeof _target) isKindOf "UO_FW_IED_PP") then { 
		UO_FW_ieds deleteAt ([_target,UO_FW_ieds] call UO_AI_fnc_getDetailsArray);	
		deleteVehicle _target;
	};
	publicVariable 'UO_FW_ieds';
	true