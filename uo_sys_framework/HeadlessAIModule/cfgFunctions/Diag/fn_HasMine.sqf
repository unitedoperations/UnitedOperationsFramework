//This function will determine if the unit has a mine, satchel, or another explosive that could be used to blow shit up. 
//Edited on: 8/13/2017 @ 0137


private _UO_FW_AI_HasMine = false;
private _magazinesAmmo = magazinesAmmo _this;
if (isNil "_magazinesAmmo") exitWith {_PushArray = [false,[],false,[]];_PushArray};
private _UO_FW_AI_HASSATCHEL = false;
private _ActualObj = [];
private _SatchelArray = [];

{
	private _Magazine = _x select 0;
	private _value = (configfile >> "CfgMagazines" >> _Magazine >> "nameSound") call BIS_fnc_getCfgData;
	
	if (_value isEqualTo "satchelcharge") then 
	{
		
		_SatchelArray pushback [((configfile >> "CfgMagazines" >> _Magazine >> "ammo") call BIS_fnc_getCfgData),_Magazine];
		_UO_FW_AI_HASSATCHEL = true;

	};
	if (_value isEqualTo "mine") then
	{
		_UO_FW_AI_HasMine = true;
		_ActualObj pushback [((configfile >> "CfgMagazines" >> _Magazine >> "ammo") call BIS_fnc_getCfgData),_Magazine];		
	};
	
	
} forEach _magazinesAmmo;

_PushArray = [_UO_FW_AI_HASSATCHEL,_ActualObj,_UO_FW_AI_HasMine,_SatchelArray];

_PushArray