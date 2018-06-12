/*	Description: Creates IEDs and connected pressure plates when the zone the IED is connected to is activated.
 * 	Arguments:
 * 		ARRAY 	- Synced IED Modules
 *		NUMBER 	- Activation Delay
 * 	Return Value:
 *		BOOL 	- True
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params [["_IEDModule",objNull,[objNull]],"_p"];
//Create IED
	if(_IEDModule isKindOf "Logic") then { 		
		private _syncedIEDPModules = [_IEDModule,["UO_FW_IEDPModule"]] call UO_AI_fnc_getSyncedModules;
		private _iedPos	= getposATL _IEDModule;
		private _iedClass = UO_FW_iedObjects select (_IEDModule getVariable ["aeIEDType",0]);
		private _iedType = _IEDModule getVariable ["aeIEDType",0];
		private _iedYield = _IEDModule getVariable ["aeIEDYield",0];
		if (_iedType == 1) then {_iedPos = _iedPos vectorAdd [0,0,-0.1];};
		if (_iedType == 4) then {_iedYield = 4;};
		if (_IEDModule getVariable ["aeIEDPractice",false]) then {_iedYield = 5;};
		private _ied = createVehicle [_iedClass, _iedPos, [], 0, "CAN_COLLIDE"];
		_ied enableSimulationGlobal false; 
		_ied enablesimulation false; 
		_ied setVariable ['UO_FW_position', _iedPos, true];
		_ied setVariable ['UO_FW_iedtype', _iedtype, true];
		_ied setVariable ['UO_FW_device', _ied, true];
		_ied setVariable ['UO_FW_yield', _iedYield, true];
		_ied setVariable ['UO_FW_iedDelay', (_IEDModule getVariable ["aeIEDDelay",0]), true];
		_ied setVariable ['UO_FW_iedmodule', _IEDModule, true];		
		UO_FW_ieds pushBack [
			_ied,
			(getPosATL _IEDModule),
			(_IEDModule getVariable ["aeIEDRadiusX",1]),
			(_IEDModule getVariable ["aeIEDRadiusY",1]),
			["CAManBase","LandVehicle"],	
			false,
			(getDir _IEDModule)
		];
	//Create Pressure Plate	
		private _iedpArray = [];
		for [{_p=0}, {(_p < count _syncedIEDPModules)}, {_p = _p + 1}] do {		
			private _syncModule = _syncedIEDPModules select _p; 
			if(typeOf _syncModule == "UO_FW_IEDPModule") then {
				private _iedp = createVehicle ["UO_FW_IED_PP", (getposATL _syncModule), [], 0, "CAN_COLLIDE"];
				_iedp enableSimulationGlobal false; 
				_iedp enablesimulation false; 
				_iedp setVariable ['UO_FW_position', _iedPos, true];
				_iedp setVariable ['UO_FW_iedtype', _iedtype, true];
				_iedp setVariable ['UO_FW_device', _ied, true];
				_iedpArray pushback _iedp;
				UO_FW_ieds pushBack [
					_iedp,
					(getPosATL _syncModule),
					(_syncModule getVariable ["aeIEDPRadiusX",1]),
					(_syncModule getVariable ["aeIEDPRadiusY",1]),
					["CAManBase","LandVehicle"],	
					false,
					(getDir _syncModule)
				];
			};
		};
		publicVariable 'UO_FW_ieds';
		_ied setVariable ['UO_FW_pp', _iedpArray, true];	
		if( !(missionnamespace getvariable ["UO_FW_iedmonitor", false]) ) then {[] spawn UO_AI_fnc_iedMonitor;};	
	};
	true