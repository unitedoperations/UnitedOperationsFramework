/*	Description: Returns an array of details for an occupied vehicle.
 *	Arguments:
 * 		OBJECT	- Object Name
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
	params ["_obj","_pos"];
	private _unitInit = _obj getVariable ["aeUnitInit",""];
	if(typename _unitInit isEqualTo "STRING") then {_unitInit = compile _unitInit;};
	if(_pos isEqualTo [])then{_pos = getPosATL _obj;};
	private _return = [
		false,
		typeOf _obj, 
		_pos, 
		vectorDir _obj, 
		vectorUp _obj, 
		damage _obj, 
		fuel _obj, 
		magazinesAllTurrets _obj, 
		locked _obj, 
		surfaceIsWater (getposATL _obj),
		_obj getVariable ["aeUnitName",""],
		_obj getVariable ['aePersistent',false],
		_unitInit, 
		_obj getVariable ['aeFlying',false],
		_obj getVariable ['aeFlyInHeight',250],
		_obj getVariable ['aeVBIED',false]
	];	
	_return
