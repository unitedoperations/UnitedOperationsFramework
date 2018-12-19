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

#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)

params [["_mode","",[""]],["_input",[],[[]]]];
	switch _mode do {
		case "init": {
			if !is3DEN then {
				diag_log format ["zone _this: %1",_this];
				if(isNil "UO_FW_AI_initialised") then {[] call UO_FW_AI_fnc_init;};
				if (isMultiplayer) then {
					waituntil {!isNil "UO_FW_var_HC_ID"};
				};
				_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]]];
				diag_log format ["case init _input: %1",_input];
				if !(_isActivated) exitWith {};
				{
					UO_FW_AI_respawns pushBack _x;
				} forEach ([_logic,["UO_FW_AI_RespawnModule"]] call UO_FW_AI_fnc_getSyncedModules);

				private _initial = _logic getVariable ["UO_FW_AI_zoneInitial",false];
				private _code = _logic getVariable ["UO_FW_AI_zoneCode","true"];
				if(typename _code isEqualTo "STRING") then {_code = compile _code;};
				private _cond = _logic getVariable ["UO_FW_AI_zoneCondition","false"];
				if(typename _cond isEqualTo "STRING") then {_cond = compile _cond;};
				private _isRectangle = if((typeof _logic) isEqualTo "UO_FW_AI_ZoneModule_R") then {true} else {false};

					UO_FW_AI_Zones pushBack [
						_logic,
						(getPosATL _logic),
						(_logic getVariable ["UO_FW_AI_zoneRadiusX",100]),
						(_logic getVariable ["UO_FW_AI_zoneOn",0]),
						([_logic getVariable ["UO_FW_AI_Zoneside",4]] call UO_FW_AI_fnc_getSide),
						(UO_FW_AI_zoneTypes select (_logic getVariable ["UO_FW_AI_zoneType",1])),
						_cond,
						(_logic getVariable ["UO_FW_AI_zoneDelay",0]),
						_code,
						(_logic getVariable ["UO_FW_AI_zoneRadiusY",100]),
						_isRectangle,
						(getDir _logic),
						(_logic getVariable ["aeZoneHazard",false])
					];
					diag_log format ["_zone added to Zones array: %1",_logic];
					diag_log format ["Zones array: %1",UO_FW_AI_Zones];
					private _entities = [_logic] call UO_FW_AI_fnc_getSyncedObjects;
					UO_FW_AI_entities pushBack [_logic,_entities];
					UO_FW_AI_zoneInit pushBack _logic;
					if((count UO_FW_AI_zoneInit) >= (count (entities [["UO_FW_AI_ZoneModule_R","UO_FW_AI_ZoneModule"],[]])) && !UO_FW_AI_templateCleanup) then {
						UO_FW_AI_templatesyncedObjects = UO_FW_AI_templatesyncedObjects arrayIntersect UO_FW_AI_templatesyncedObjects;
						[UO_FW_AI_templatesyncedObjects] call UO_FW_AI_fnc_deleteVehicles;
						UO_FW_AI_templateCleanup = true;
					};

				if (UO_FW_AI_DEBUG) then {
					private _syncedModules = [_logic,[]] call UO_FW_AI_fnc_getSyncedModules;
					_entities params [["_grps",[],[[]]],["_emptyvehs",[],[[]]],["_objs",[],[[]]]];
					if (count _syncedModules == 0 && ({(count _x) > 0 } count _grps) == 0 && ({(count _x) > 0 } count _emptyvehs) == 0 && ({(count _x) > 0 } count _objs) == 0) then {
						_msg = format["%1 a %2 has nothing linked.\nYou can link Units, Groups, Objects or other modules to a Zone Module.",_logic,typeof _logic];
						UO_FW_DEBUG("",_msg)
					};
					[_logic] spawn UO_FW_AI_fnc_debugSyncedModules;
				};

				if (_initial) then {
					[_logic,0,_code,{},_initial] call UO_FW_AI_fnc_setup;
					_logic setVariable ["UO_FW_zone_activated",true];
					_logic setVariable ["UO_FW_AI_zoneOn",1];
				};
			};
		};
		case "attributesChanged3DEN": {
			_logic = _input param [0,objNull,[objNull]];
			private _radiusX = _logic getVariable ["UO_FW_AI_zoneRadiusX",_logic getVariable ["aeZoneRadius", 100]];
			private _radiusY = _logic getVariable ["UO_FW_AI_zoneRadiusY",_logic getVariable ["aeZoneRadius", 100]];
			set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
		};
		default {};
	};
	true
