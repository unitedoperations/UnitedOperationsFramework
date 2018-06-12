/*	Description: Check players EOD skill level and adjust interact time and chance.
 * 	Arguments:
 *		OBJECT	- Unit
 *		OBJECT	- Target Object
 * 	Return Value:
 *		ARRAY
 *			NUMBER	- Interact Time
 *			NUMBER	- Skill / Chance of Failure
 */
params [
	["_unit", objNull, [objNull]],
	["_target", objNull, [objNull]],
	["_canExplodeOnFail", true, [true]],
	["_skill", 500, [0]]
];
	private _time = _target getVariable ["UO_FW_revealtime", getNumber (configFile >> "CfgVehicles" >> typeof _target >> "UO_FW_revealtime")];	
	private _return	= [_time,_skill];	
	if (_canExplodeOnFail) then {
		switch (_unit getvariable ["asor_role", getText (configFile >> 'CfgVehicles' >> typeof _unit >> 'asor_role')]) do {
			case "EOD";
			case "engineer": { 
				if("ACE_DefusalKit" in (items _unit)) then {
					_skill = random 500; 
				} else {
					_skill = random 250;
					_time = _time*2;
				};				 
			};
			default {
				_time = _time*4;
				_skill = random 100;
			};
		};
	};
	_return set [0,_time];
	_return set [1,_skill];	
	_return