/*	Description: Creates flag on ied when checking for connected ieds.
 * 	Arguments:
 *		ARRAY	- Unit and Target
 * 	Return Value:
 *		BOOL 	- True or False
 */
if(!isServer) exitWith { _this remoteExec ["UO_AI_fnc_iedFind", 2]; };
params [["_target",objNull,[objNull]]];
	private _iedPos = (_target getVariable ["UO_FW_position", []] ) vectorAdd [0.3,0.3,0];
	private _device	= _target getVariable ["UO_FW_device", _target];
	private _flag = "FlagSmall_F" createVehicle _iedPos;
	_flag setPosATL _iedPos;
	_device setVariable ["UO_FW_flagmarker",_flag,true];
	_target setVariable ["UO_FW_flagmarker",_flag,true];	
	true