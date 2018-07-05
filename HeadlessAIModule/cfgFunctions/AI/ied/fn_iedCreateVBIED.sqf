/*	Description: Detonate VBIED.
 * 	Arguments:
 *		OBJECT	- Unit
 *		OBJECT	- Target Object
 * 	Return Value:
 *		BOOL 	- True or False
 */
params["_v","_vbied"];	
	if (_vbied) then {
		_v setVariable ['aeVBIED', _vbied, true];
		private _aeEHVBIED = _v addMPEventHandler ["mpkilled", {
			(_this select 0) removeMPEventHandler ["mpkilled",_thisEventHandler ];
			"UO_FW_IED_Bomb_Huge" createVehicle (getPos (_this select 0)); 			
		}];
		_v setVariable ['aeEHVBIED',_aeEHVBIED,true];
		_v setVariable ['UO_FW_position', getPos _v, true];
		_v setVariable ['UO_FW_iedtype', 6, true];
		_v setVariable ['UO_FW_device', _v, true];
		_v setVariable ['UO_FW_yield', 6, true];
	};
	true