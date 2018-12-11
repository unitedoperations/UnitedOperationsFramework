/*	Description: Zone Module initialisation creates the zone.
 *	Arguments:
 * 		OBJECT	- Module (name, _logic)
 *		ARRAY	- Units (synced to module)
 *		BOOL	- Module Activated
 * 	Return Value:
 * 		BOOL	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"

params [["_mode","",[""]],["_input",[],[[]]]];
	diag_log format ["zone _this: %1",_this];
	if(isNil "UO_FW_AI_initialised") then {[] call UO_AI_fnc_init;};
	switch _mode do {
		case "init": {
			if !is3DEN then {
				_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]]];
				diag_log format ["case init _input: %1",_input];
				if !(_isActivated) exitWith {};
				UO_FW_EXEC_CHECK(SERVERHC)
				{
					UO_FW_respawns pushBack _x;
				} forEach ([_logic,["UO_FW_RespawnModule"]] call UO_AI_fnc_getSyncedModules);
				
				private _initial = _logic getVariable ["aeZoneInitial",false];
				private _code = _logic getVariable ["aeZoneCode","true"];
				if(typename _code isEqualTo "STRING") then {_code = compile _code;};
				private _cond = _logic getVariable ["aeZoneCondition","false"];
				if(typename _cond isEqualTo "STRING") then {_cond = compile _cond;};
				private _isRectangle = if((typeof _logic) isEqualTo "UO_FW_ZoneModule_R") then {true} else {false};
				
				if (_initial) then {
					[_logic,0,_code,{},_initial] spawn UO_AI_fnc_setup;
					_logic setVariable ["UO_FW_zone_activated",true];
					_logic setVariable ["aeZoneOn",1];
				} else {
					UO_FW_zones pushBack [
						_logic,
						(getPosATL _logic),
						(_logic getVariable ["aeZoneRadiusX",100]),
						(_logic getVariable ["aeZoneOn",0]),
						([_logic getVariable ["aeZoneSide",4]] call UO_AI_fnc_getSide),
						(UO_FW_zoneTypes select (_logic getVariable ["aeZoneType",1])),
						_cond,
						(_logic getVariable ["aeZoneDelay",0]),
						_code,					
						(_logic getVariable ["aeZoneRadiusY",100]),					
						_isRectangle,
						(getDir _logic),
						(_logic getVariable ["aeZoneHazard",false])
					];
					private _entities = [_logic] call UO_AI_fnc_getSyncedObjects;							
					UO_FW_entities pushBack [_logic,_entities];
					UO_FW_zoneInit pushBack _logic;
					if((count UO_FW_zoneInit) >= (count (entities [["UO_FW_ZoneModule_R","UO_FW_ZoneModule"],[]])) && !UO_FW_templateCleanup) then {
						UO_FW_templateSyncedObjects = UO_FW_templateSyncedObjects arrayIntersect UO_FW_templateSyncedObjects;
						[UO_FW_templateSyncedObjects] call UO_AI_fnc_deleteVehicles; 
						UO_FW_templateCleanup = true;
					};
				};
				
				private _syncedModules = [_logic,[]] call UO_AI_fnc_getSyncedModules;
				_entities params [["_grps",[],[[]]],["_emptyvehs",[],[[]]],["_objs",[],[[]]]];
				if (count _syncedModules == 0 && ({(count _x) > 0 } count _grps) == 0 && ({(count _x) > 0 } count _emptyvehs) == 0 && ({(count _x) > 0 } count _objs) == 0) then {
					_msg = format["%1 a %2 has nothing linked.\nYou can link Units, Groups, Objects or other modules to a Zone Module.",_logic,typeof _logic];
					UO_FW_DEBUG("",_msg)
				};		
				[_logic] spawn UO_AI_fnc_debugSyncedModules;			
			};
		};
		case "attributesChanged3DEN": {
			_logic = _input param [0,objNull,[objNull]];
			private _radiusX = _logic getVariable ["aeZoneRadiusX",_logic getVariable ["aeZoneRadius", 100]];
			private _radiusY = _logic getVariable ["aeZoneRadiusY",_logic getVariable ["aeZoneRadius", 100]];
			set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
		};
		default {};
	};
	true