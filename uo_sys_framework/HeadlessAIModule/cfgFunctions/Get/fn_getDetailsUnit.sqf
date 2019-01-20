/*	Description: Returns an array of details for an occupied vehicle.
 *	Arguments:
 * 		OBJECT	- Object Name
 *	Return Value:
 * 		ARRAY
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
	params ["_u","_pos","_veh"];
	private _unitInit = _u getVariable ["UO_FW_AI_unitInit","true"];
	if (typename _unitInit isEqualTo "STRING") then {_unitInit = compile _unitInit;};
	private _vehAssigned = if ((assignedVehicleRole _u) isEqualTo [])then{false}else{true};
	_return = [
		true,
		typeOf _u,
		_pos,
		false,
		vectorDir _u,
		vectorUp _u,
		damage _u,
		getUnitLoadout _u,
		typeOf _veh,
		assignedVehicleRole _u,
		_vehAssigned,
		_u getVariable ["ACE_captives_isHandcuffed",false],
		(surfaceIsWater (getposATL _u)),
		_u getVariable ['UO_FW_AI_unitPersistent',false],
		_u getVariable ['UO_FW_AI_stance','auto'],
		_u getVariable ['UO_FW_AI_remove',0],
		_unitInit,
		_u getVariable ['UO_FW_AI_unitName',""],
		_u getVariable ['UO_FW_AI_unitIdentity',""]
	];
	_return
