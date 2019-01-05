/*	Description: Create a vehicle and apply required settings.
 * 	Arguments:
 * 		ARRAY	- Position to create the vehicle at
 *		ARRAY	- Required Unit Settings
 * 	Return Value:
 * 		OBJECT 	- Vehicle with settings
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params ["_pos","_veh","_side"];
	_veh params ["_uv","_uc","_vpos","_vcd","_vcu","_dmg","_f","_a","_vlc","_vw","_name","_per","_init","_fly","_flyInHeight"];
	private _flying = if(_fly && (_uc isKindOf "Air")) then {"FLY"}else{"NONE"};
	if(_flying == "FLY")then {
		_pos = ([_pos select 0, _pos select 1, _flyInHeight] vectorAdd [0,0,150]);
	};
	private _v = createVehicle [_uc, _pos,[],0,_flying];
	_v setVectorDirAndUp [_vcd,_vcu];
	_v setPosATL _pos;
	if(_fly)then {
		_v FlyInHeight _flyInHeight;
		_v setVelocity [((velocity _v) select 0) + (sin (getDir _v) * 80),((velocity _v) select 1) + (cos (getDir _v) * 80),((velocity _v) select 2)];
	};
	_v setDamage _dmg;
	_v setFuel _f;
	_v lock _vlc;
	{
		_x params [["_class","",[""]],["_path",[],[[]]],["_ammo",0,[0]]];
		_v setMagazineTurretAmmo [_class,_ammo,_path];
	} forEach _a;
	if(count _name > 1) then {
		missionNamespace setVariable[_name, _v];
	};
	if (UO_FW_AI_AutoTrackAssets_Enabled) then {
		_team = "";
		switch (_side) do {
			case west: {_team = UO_FW_AI_TeamSetting_Blufor_TeamName};
			case east: {_team = UO_FW_AI_TeamSetting_Opfor_TeamName};
			case independent: {_team = UO_FW_AI_TeamSetting_Indfor_TeamName};
			case civilian: {_team = UO_FW_AI_TeamSetting_Civ_TeamName};
		};
		if (!_team isEqualto "") then {
			_vehCfg = (configFile >> "CfgVehicles" >> (typeOf _v));
			if (isText(_vehCfg >> "displayName")) then {
				[_v, getText(_vehCfg >> "displayName"), _team] call UO_FW_AI_fnc_TrackAsset;
			};
		};
	};
	[_v,_per] call UO_FW_AI_fnc_setPersistent;
	_v spawn _init;
	_v
