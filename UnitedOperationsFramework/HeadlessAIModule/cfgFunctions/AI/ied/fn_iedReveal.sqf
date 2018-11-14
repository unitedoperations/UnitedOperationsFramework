/*	Description: Reveals IED if used on IED, or places flag on IED if used on pressure plate.
 * 	Arguments:
 *		OBJECT	- Unit and Target
 * 	Return Value:
 *		BOOL 	- True or False
 */
if(!isServer) exitWith { _this remoteExec ["UO_AI_fnc_iedReveal", 2]; };
params ["_target"];
	//if target is a pressure plate run find ied function
	if((typeof _target) isKindOf ["UO_FW_IED_PP", configFile >> "CfgVehicles"]) exitWith { _target call UO_AI_fnc_iedFind; };
	
	//get old ied settings
	private _IEDModule = _target getVariable ['UO_FW_iedmodule', objNull];
	private _pressurePlates = _target getVariable ["UO_FW_pp", []];
	private _iedtype = _target getVariable ["UO_FW_iedtype", 1];
	private _iedYield = _target getVariable ["UO_FW_yield", 5];
	private _flagMarker = _target getVariable ["UO_FW_flagmarker",objNull];
	
	//remove old ied
	UO_FW_ieds deleteAt ([_target,UO_FW_ieds] call UO_AI_fnc_getDetailsArray);
	deleteVehicle _target;
	
	//create new ied
	private _ied = createVehicle ["UO_FW_IED_Buried_LG", (getPosATL _IEDModule), [], 0, "CAN_COLLIDE"];
	
	//add old ied settings to new ied
	_ied setVariable ["UO_FW_position", getposATL _IEDModule, true];	
	_ied setVariable ["UO_FW_iedtype", _iedtype, true];
	_ied setVariable ["UO_FW_device", _ied, true];
	_ied setVariable ['UO_FW_yield', _iedYield, true];
	_ied setVariable ['UO_FW_iedmodule', _IEDModule, true];
	_ied setVariable ['UO_FW_iedDelay', (_IEDModule getVariable ["aeIEDDelay",0]), true];
	_ied setVariable ["UO_FW_pp", _pressurePlates, true];
	_ied setVariable ["UO_FW_flagmarker",_flagMarker];
	{ 
		_x setVariable ["UO_FW_device", _ied, true]   
	} foreach _pressurePlates;	
	
	//set detection of new ied
	UO_FW_ieds pushBack [
		_ied,
		(getPosATL _IEDModule),
		(_IEDModule getVariable ["aeIEDRadiusX",1]),
		(_IEDModule getVariable ["aeIEDRadiusY",1]),
		["CAManBase","LandVehicle"],	
		false,
		(getDir _IEDModule)
	];
	publicVariable 'UO_FW_ieds';	
	true