/*	Description: Detonate IED.
 * 	Arguments:
 *		OBJECT	- Target Object
 * 	Return Value:
 *		BOOL 	- True or False
 */
if(!isServer) exitWith {_this remoteExec ["UO_AI_fnc_iedDetonate",2];};
params [
	["_target",objNull,[objNull]],
	["_unit",objNull,[objNull]],
	["_units",[],[[]]]
];
	private _ied = _target getVariable ["UO_FW_device", objNull];
	private _pos = getPos _ied;
	private _yield = _ied getVariable ["UO_FW_yield",0];	
	
	_nearbyEntities = _pos nearEntities [["CAManBase"], 100];
	{
		private _aeEHIED = _x addMPEventHandler ["mpkilled", {
			"BloodPool_01_Large_New_F" createVehicle (getPos (_this select 0));
			(_this select 0) removeMPEventHandler ["mpkilled",_thisEventHandler ]; 			
		}];	
		_units pushBack [_x, _aeEHIED];
	} forEach _nearbyEntities;		
	
	switch(_yield) do {
		case 0: {  //Small
			"UO_FW_IED_Bomb_Small" createVehicle _pos;
			[_pos, _yield, 50] remoteExec ["UO_AI_fnc_iedBlastEffects",0];
		};
		case 1: {  //Medium
			"UO_FW_IED_Bomb_Medium" createVehicle _pos;
			[_pos, _yield, 150] remoteExec ["UO_AI_fnc_iedBlastEffects",0];
		};
		case 2: {  //Large
			"UO_FW_IED_Bomb_Large" createVehicle _pos;
			[_pos, _yield, 200] remoteExec ["UO_AI_fnc_iedBlastEffects",0];
		};
		case 3: {  //Huge
			"UO_FW_IED_Bomb_Huge" createVehicle _pos;
			[_pos, _yield, 300] remoteExec ["UO_AI_fnc_iedBlastEffects",0];
		};
		case 4: {  //Decoy / Defuse 
		
		};
		case 5: {  //Practice
			if(isNull _unit) then {_unit = 0;};
			//createVehicle ["SmokeShellRed", _pos, [], 0, "NONE"];
			"IED DETONATED - PRACTICE FAILED" remoteExec ["hint", _unit];				
		};
		case 6: {  //VBIED
			if ((floor random 100) > 20) then {
				//"DETONATION IN PROGRESS! - EXPLOSIVE TRIGGERED" remoteExec ["hint", _unit];
				//add sound here
				sleep (random [5, 10, 15]);
			};
			_ied setDamage 1;
			[_pos, _yield, 400] remoteExec ["UO_AI_fnc_iedBlastEffects",0];
			//"UO_FW_IED_Bomb_Huge" createVehicle (getPos _target);
		};
		default {};
	};
	
	if(!(_yield == 6)) then {
		_ied spawn UO_AI_fnc_iedDeleteIEDandPPs;
	};
	
	sleep 2;
	
	{
		_x params ["_u","_eh"];
		if(alive _u) then {
			_u removeMPEventHandler ["mpkilled",_eh];	
		};
	} forEach _units;		
	true
