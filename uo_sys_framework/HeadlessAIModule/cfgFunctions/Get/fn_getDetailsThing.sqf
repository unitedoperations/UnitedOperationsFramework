/*	Description: Returns an array of details for a type of Thing.
 *	Arguments:
 * 		OBJECT	- Object Name
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
	params ["_obj",["_pos",[],[[]]]];
	private _unitInit = _obj getVariable ["UO_FW_unitInit",""];
	if(typename _unitInit isEqualTo "STRING") then {_unitInit = compile _unitInit;};
	if(_pos isEqualTo [])then{_pos = (getposATL _obj)};
	private _return = [
		typeOf _obj, 
		_pos, 
		vectorDir _obj, 
		vectorUp _obj, 
		damage _obj, 
		surfaceIsWater (getposATL _obj),
		_obj getVariable ["UO_FW_unitName",""],
		_obj getVariable ['UO_FW_unitPersistent',false],
		_unitInit
	];
	_return