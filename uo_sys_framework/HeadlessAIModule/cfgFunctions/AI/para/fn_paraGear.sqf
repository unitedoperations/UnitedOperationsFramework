disableSerialization;
private["_this", "_slot","_loadout","_primary","_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_handle"];
waitUntil {sleep 5; ((getPos player) select 2) < 2; };
removeBackpackGlobal ASORGS_Player;
removeBackpackGlobal ASORGS_Player;
_loadout = ASORGS_CurrentInventory;
if(isNil {_loadout}) exitWith {}; //Slot data doesn't exist
ASORGS_loading_preset = true;
_loadout params ["_name", "_primary", "_launcher", "_handgun", "_magazines", "_uniform", "_vest", "_backpack", "_items", "_primitems", "_secitems", "_handgunitems", "_uitems", "_vitems", "_bitems", ["_insignia", "", [""]]];
if(!ASORGS_ShowBackpack) then { _backpack = backpack ASORGS_Player};
if(!ASORGS_ShowBackpack || [_backpack, true] call ASORGS_fnc_isAllowed) then {ASORGS_Player addBackpack _backpack; };
clearMagazineCargoGlobal (unitBackpack ASORGS_Player);
clearItemCargoGlobal (unitBackpack ASORGS_Player);
clearWeaponCargoGlobal (unitBackpack ASORGS_Player);
[_uitems, _vitems, _bitems] spawn {
	
	_addItems = {
		_loadRadios = _this select 0;
		_loadItems = _this select 1;
		_uitems = _this select 2 select 0;
		_vitems = _this select 2 select 1;
		_bitems = _this select 2 select 2;
		{ 	
			_class = _x;
			_isradio = (tolower getText (configFile >> "cfgWeapons" >> _class >> "Simulation")) == "itemradio";
			_isradio = _isradio || ([_class, "acre_"] call UO_FW_AI_fnc_StartsWith);
			if(_isradio) then {
				_class = [_class, false] call ASORGS_fnc_GetRadioClass;
			};
			if(([_class, true] call ASORGS_fnc_isAllowed) && ((_isradio && _loadRadios) || ((!_isradio) && _loadItems ))) then {
				ASORGS_Player addItemToUniform _class;
			};
		} forEach (_uitems);
		{ 	_class = _x;
			_isradio = (tolower getText (configFile >> "cfgWeapons" >> _class >> "Simulation")) == "itemradio";
			_isradio = _isradio || ([_class, "tf_"] call UO_FW_AI_fnc_StartsWith) || ([_class, "acre_"] call UO_FW_AI_fnc_StartsWith);
			if(_isradio) then {
				_class = [_class, false] call ASORGS_fnc_GetRadioClass; 
			};
			if(([_class, true] call ASORGS_fnc_isAllowed) && ((_isradio && _loadRadios) || ((!_isradio) && _loadItems ))) then {
				ASORGS_Player addItemToVest _class;
			};
		} forEach (_vitems);
		{ 	_class = _x;
			_isradio = (tolower getText (configFile >> "cfgWeapons" >> _class >> "Simulation")) == "itemradio";
			_isradio = _isradio || ([_class, "tf_"] call UO_FW_AI_fnc_StartsWith) || ([_class, "acre_"] call UO_FW_AI_fnc_StartsWith);
			if(_isradio) then {
				_class = [_class, false] call ASORGS_fnc_GetRadioClass;
			};
			if(([_class, true] call ASORGS_fnc_isAllowed) && ((_isradio && _loadRadios) || ((!_isradio) && _loadItems ))) then {
				ASORGS_Player addItemToBackpack _class;
			};
		} forEach (_bitems);
	};
	[true, true, _this] call _addItems;
	
	ASORGS_loading_preset = nil;	
};
