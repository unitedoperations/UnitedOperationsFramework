/*	Description: Gets synced modules list and checks if correct modules linked.
 *	Displays error message in debug mode if wrong links exist.
 * 	Arguments:
 * 		OBJECT	- Module (name, _logic)
 * 	Return Value:
 * 		BOOL 	- True
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params ["_logic"];
	private _type	= typeof _logic;
	private _synced = synchronizedObjects _logic;	
	if (UO_FW_AI_enabled) then {
		switch (_type) do {
			case "UO_FW_ZoneModule_R";
			case "UO_FW_ZoneModule": {
				private _allowedLinks = ["UO_FW_ControlModule","UO_FW_ControlModule_R","UO_FW_TaskModule","UO_FW_PositionModule","UO_FW_PositionModule_R","UO_FW_IEDModule","UO_FW_FastAirStrikeModule","UO_FW_AirDropModule","UO_FW_HeloInsertModule","UO_FW_ArtilleryStrikeModule","UO_FW_RespawnModule","UO_FW_RotaryModule","Group","Object","Vehicle"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = "";
					if(_syncItem isKindOf "Man") then {
						_check = "Group";
					} else {
						if(_syncItem isKindOf "Thing") then {
							_check = "Object";
						} else {
							if((_syncItem isKindOf "StaticWeapon" || _syncItem isKindOf "Static" || _syncItem isKindOf "Air" || _syncItem isKindOf "Ship" || _syncItem isKindOf "LandVehicle")) then {
								_check = "Vehicle";
							} else {
								_check = typeof _syncItem;
							};
						};
					};
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then { 
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			case "UO_FW_TaskModule": {
				private _allowedLinks = ["UO_FW_ZoneModule","UO_FW_ZoneModule_R","UO_FW_TaskModule","Group"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = "";
					if(_syncItem isKindOf "Man" || _syncItem isKindOf "AllVehicles" || _syncItem isKindOf "StaticWeapon" || _syncItem isKindOf "Static" || _syncItem isKindOf "Air" || _syncItem isKindOf "Ship" || _syncItem isKindOf "LandVehicle") then {_check = "Group";} else {_check = typeof _syncItem;};
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then {
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			case "UO_FW_ControlModule_R";
			case "UO_FW_ControlModule": {
				private _allowedLinks = ["UO_FW_ZoneModule","UO_FW_ZoneModule_R","UO_FW_IEDModule","UO_FW_RotaryModule","Group","Object","Vehicle"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = "";
					if(_syncItem isKindOf "Man") then {
						_check = "Group";
					} else {
						if(_syncItem isKindOf "Thing") then {
							_check = "Object";
						} else {
							if((_syncItem isKindOf "StaticWeapon" || _syncItem isKindOf "Static" || _syncItem isKindOf "Air" || _syncItem isKindOf "Ship" || _syncItem isKindOf "LandVehicle")) then {
								_check = "Vehicle";
							} else {
								_check = typeof _syncItem;
							};
						};
					};
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then { 
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			case "UO_FW_IEDModule": {
				private _allowedLinks = ["UO_FW_ZoneModule","UO_FW_ZoneModule_R","UO_FW_IEDPModule"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = typeof _syncItem;
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then {
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			case "UO_FW_IEDPModule": {
				private _allowedLinks = ["UO_FW_IEDModule"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = typeof _syncItem;
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then {
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			case "UO_FW_FastAirStrikeModule": {
				private _allowedLinks = ["UO_FW_ZoneModule","UO_FW_ZoneModule_R","UO_FW_PositionModule","UO_FW_PositionModule_R","UO_FW_TemplateModule","Vehicle"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = "";
					if( _syncItem isKindOf "Air") then {
						_check = "Vehicle";
					} else {
						_check = typeof _syncItem;
					};
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then { 
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			case "UO_FW_AirDropModule";
			case "UO_FW_HeloInsertModule": {
				private _allowedLinks = ["UO_FW_ZoneModule","UO_FW_ZoneModule_R","UO_FW_PositionModule","UO_FW_PositionModule_R","UO_FW_TemplateModule"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = typeof _syncItem;
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then {
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			case "UO_FW_ArtilleryStrikeModule": {
				private _allowedLinks = ["UO_FW_ZoneModule","UO_FW_ZoneModule_R","UO_FW_TemplateModule","Group","Vehicle"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = "";
					if(_syncItem isKindOf "Man") then {
						_check = "Group";
					} else {
						if((_syncItem isKindOf "StaticWeapon" || _syncItem isKindOf "Static" || _syncItem isKindOf "LandVehicle")) then {
							_check = "Vehicle";
						} else {
							_check = typeof _syncItem;
						};
					};
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then { 
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			case "UO_FW_PositionModule_R";
			case "UO_FW_PositionModule": {
				private _allowedLinks = ["UO_FW_ZoneModule","UO_FW_ZoneModule_R","UO_FW_TemplateModule","UO_FW_FastAirStrikeModule","UO_FW_AirDropModule","UO_FW_HeloInsertModule","UO_FW_NonCombatantModule","Group","Object","Vehicle"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = "";
					if(_syncItem isKindOf "Man") then {
						_check = "Group";
					} else {
						if(_syncItem isKindOf "Thing") then {
							_check = "Object";
						} else {
							if((_syncItem isKindOf "StaticWeapon" || _syncItem isKindOf "Static" || _syncItem isKindOf "Air" || _syncItem isKindOf "Ship" || _syncItem isKindOf "LandVehicle")) then {
								_check = "Vehicle";
							} else {
								_check = typeof _syncItem;
							};
						};
					};
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then { 
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			case "UO_FW_TemplateModule": {
				private _allowedLinks = ["UO_FW_PositionModule","UO_FW_PositionModule_R","UO_FW_FastAirStrikeModule","UO_FW_AirDropModule","UO_FW_HeloInsertModule","Group","Object","Vehicle"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = "";
					if(_syncItem isKindOf "Man") then {
						_check = "Group";
					} else {
						if(_syncItem isKindOf "Thing") then {
							_check = "Object";
						} else {
							if((_syncItem isKindOf "StaticWeapon" || _syncItem isKindOf "Static" || _syncItem isKindOf "Air" || _syncItem isKindOf "Ship" || _syncItem isKindOf "LandVehicle")) then {
								_check = "Vehicle";
							} else {
								_check = typeof _syncItem;
							};
						};
					};
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then { 
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			case "UO_FW_NonCombatantModule": {
				private _allowedLinks = ["Group","UO_FW_PositionModule","UO_FW_PositionModule_R"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = "";
					if(_syncItem isKindOf "Man") then {_check = "Group";} else {_check = typeof _syncItem;};
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then {
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			case "UO_FW_RotaryModule": {
				private _allowedLinks = ["UO_FW_LZModule","UO_FW_ControlModule","UO_FW_ControlModule_R"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = typeof _syncItem;
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then {
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			case "UO_FW_RespawnModule": {
				private _allowedLinks = ["UO_FW_ZoneModule","UO_FW_ZoneModule_R"];
				for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
					private _syncItem = _synced select _j;
					private _check = typeof _syncItem;
					private _allowed = _check in _allowedLinks;
					if (!_allowed) then {
						if (_logic != _syncItem) then {(format["%2 a %3 is incorrectly linked to %1 a %4.",_logic,_syncItem,_check,_type]) call UO_FW_fnc_DebugMessage;};
					};
				};
			};
			default { hint format["Invalid Logic Type - %1", _type];};
		};
	};
	true