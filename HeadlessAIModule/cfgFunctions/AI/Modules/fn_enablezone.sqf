/*	Description: Enable Zone Module initialisation disables attached zones and creates a zone out of zone enable module that when activated enables the connected zones modules.
 *	Arguments:
 * 		OBJECT	- Module (name, _logic)
 *		ARRAY	- Units (synced to module)
 *		BOOL	- Module Activated
 * 	Return Value:
 * 		BOOL	- True
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params [["_mode","",[""]],["_input",[],[[]]]];
	if(isNil {UO_FW_AI_initialised}) then {call UO_AI_fnc_init;};
	switch _mode do {
		case "init": {
			if !is3DEN then {
				_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]]];
				if !(_isActivated) exitWith {};	
				sleep 1;
				if (UO_FW_AI_enabled) then {				
					// Disable Linked Zones
					_syncedZoneModules = [_logic,["UO_FW_ZoneModule","UO_FW_ZoneModule_R"]] call UO_AI_fnc_getSyncedModules;	
					if (count _syncedZoneModules > 0) then {
						for [{_z=0}, {(_z < count _syncedZoneModules)}, {_z = _z + 1}] do { 
							_syncedZoneModule = _syncedZoneModules select _z;
							([_syncedZoneModule,UO_FW_zones] call UO_AI_fnc_getDetails) set [3, 1];
						};
					};	
					//Setup Suspend Module as Zone				
					_cond = _logic getVariable ["aeEnableZoneCondition","false"];
					if(typename _cond isEqualTo "STRING") then {_cond = compile _cond;};
					_code = _logic getVariable ["aeEnableZoneCode","true"];
					if(typename _code isEqualTo "STRING") then {_code = compile _code;};
					_isRectangle = if((typeof _logic) isEqualTo "UO_FW_ZoneModule_R") then {true} else {false};
					UO_FW_zones pushBack [
						_logic,
						(getPosATL _logic),
						(_logic getVariable ["aeEnableZoneRadiusX",200]),
						0,
						([_logic getVariable ["aeEnableZoneSide",0]] call UO_AI_fnc_getSide),
						(UO_FW_zoneTypes select (_logic getVariable ["aeEnableZoneType",1])),
						_cond,
						(_logic getVariable ["aeEnableZoneDelay",0]),
						_code,
						(_logic getVariable ["aeEnableZoneRadiusY",200]),
						_isRectangle,
						(getDir _logic),
						(_logic getVariable ["aeZoneHazard",false])
					];
					_entities = [_logic] call UO_AI_fnc_getSyncedObjects;
					UO_FW_entities pushBack [_logic,_entities];
					if(UO_FW_AI_DEBUG) then {
						_syncedZoneModule = [_logic,["UO_FW_ZoneModule","UO_FW_ZoneModule_R"]] call UO_AI_fnc_getSyncedModules;
						if (count _syncedZoneModule == 0) then { 
							(format["%1 a %2 has no Zone Modules linked.\nLink a Zone Module to the Enable Zone Module to suspend and enable Zones when the Enable Zone Module is activated.",_logic,typeof _logic]) call UO_FW_fnc_DebugMessage;
						};
						[_logic] spawn UO_AI_fnc_debugSyncedModules;
					};
				};
			};
		};
		case "attributesChanged3DEN": {
			_logic = _input param [0,objNull,[objNull]]; 
			private _radiusX = _logic getVariable ["aeEnableZoneRadiusX",_logic getVariable ["aeEnableZoneRadius", 100]];
			private _radiusY = _logic getVariable ["aeEnableZoneRadiusY",_logic getVariable ["aeEnableZoneRadius", 100]];
			set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
		};
		case "registeredToWorld3DEN": {
			_logic = _input param [0,objNull,[objNull]]; 
			// ... code here...
		};
		case "unregisteredFromWorld3DEN": {
			_logic = _input param [0,objNull,[objNull]]; 
			// ... code here...
		};
		case "connectionChanged3DEN": {
			_logic = _input param [0,objNull,[objNull]]; 
			// ... code here...
		};
	};
	true
	
	