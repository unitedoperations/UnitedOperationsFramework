/*	Description: Gets the state of all actions on an IED or Pressure Plate. Fill the actions array with default falses if it's not already big enough.
 * 	Arguments:
 *		OBJECT	- IED or Pressure Plate
 * 	Return Value:
 *		[BOOL,BOOL,....]	- Boolean for each pressure plate.
 */
params ["_target"];  
	private _actions = _target getVariable ["UO_FW_defuseactions", []];
	/*private _count = count ("true" configClasses (configFile >> "CfgVehicles" >> typeof _target >> "ACE_Actions" >> "ACE_MainActions"));*/
	private _count = getNumber (configFile >> "CfgVehicles" >> typeof _target >> "UO_FW_actionindex");
	while{count _actions < _count} do {
		_actions pushBack false;			
	};
	_actions