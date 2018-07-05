/*	Description: Updates an IED when an action is completed.
 * 	Arguments:
 *		OBJECT	- Unit
 *		OBJECT 	- Target (IED or Pressure Plate)
 *		NUMBER 	- Action Index
 *		BOOL 	- Use Skill Check
 *		STRING	- Message (or "" for none)
 *		BOOL	- Explode
 *		BOOL	- Explode if order is wrong
 * 	Return Value:
 *		BOOL 	- True
 */
params [
	"_unit", 
	"_target", 
	"_actionIndex", 
	"_canExplodeOnFail", 
	"_message", 
	"_forceExplode", 
	"_explodeIfOrderWrong",
	["_detonated",false,[false]]
];
	if(_message != "") then {hint _message;};
	private _actions = _target call UO_AI_fnc_iedActionStates;
	if(_explodeIfOrderWrong && (_actionIndex > 0)) then {
		//Previous action hasn't been done.. blow up.
		if(!(_actions select (_actionIndex-1)) && !(_target getVariable ["UO_FW_defused", false])) then {
			(getPos _target) remoteExec ["UO_AI_fnc_iedPlaySwitchSound",0];
			sleep 2;
			[_target,_unit] spawn UO_AI_fnc_iedDetonate;
			_detonated = true;
		};
	};
	if(_detonated) exitWith {};
	
	//Add a chance to blow up at the end of the progress bar.
	([_unit,_target,_canExplodeOnFail] call UO_AI_fnc_iedActionTimeAndSkill) params ["_time", "_skill"];
	if(_forceExplode || (_canExplodeOnFail && (_skill < 3)) && !(_target getVariable ["UO_FW_defused", false]) ) then {
		[_target,_unit] spawn UO_AI_fnc_iedDetonate;
	} else {
		private _cfg = (configFile >> "CfgVehicles" >> typeof _target);
		if(_actionIndex == getNumber ( _cfg >> "UO_FW_defuseaction")) then {
			_target setVariable ["UO_FW_defused", true, true];
		};
		if (_target getVariable ["UO_FW_iedtype", 6] < 4 ) then {
			if(_actionIndex == getNumber ( _cfg >> "UO_FW_dismantleaction")) then {
				if((typeof _target) isKindOf "UO_FW_IED_PP") then {
					_target call UO_AI_fnc_iedRemovePP;
				} else {
					_target call UO_AI_fnc_iedDeleteIEDandPPs;						
				};
			};
			if(_actionIndex == getNumber ( _cfg >> "UO_FW_revealaction")) then {
				_target call UO_AI_fnc_iedReveal;
			};
		};
		if(_actionIndex == getNumber ( _cfg >> "UO_FW_removeaction") && _target getVariable ["aeVBIED",false]) then {
			_target setVariable ["aeVBIED",false,true];
			_target removeMPEventHandler ["mpkilled", _target getVariable 'aeEHVBIED'];
		};
		
		//Update the action state
		_actions set [_actionIndex, true];
		_target setVariable ["UO_FW_defuseactions", _actions, true];
	};
	true