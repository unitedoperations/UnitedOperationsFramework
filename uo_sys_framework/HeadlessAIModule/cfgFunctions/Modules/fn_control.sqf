/*	Description: Control Module performs three functions
 *		1) On initialisation can disable/enable/nothing to synced zone modules, configurable in settings under initiate action
 *		2) Creates a zone out of the control module which is fully functional as a zone
 *		3) When the control modules zone is activated can enable/disable any synced zone modules, configurable for either in settings under activate action
 *	Arguments:
 * 		OBJECT	- Module (name, _logic)
 *		ARRAY	- Units (synced to module)
 *		BOOL	- Module Activated
 * 	Return Value:
 * 		BOOL	- True
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(ALL)

params [["_mode","",[""]],["_input",[],[[]]]];
	if(isNil "UO_FW_AI_initialised") then {call UO_FW_AI_fnc_init;};
	switch _mode do {
		case "init": {
			if !is3DEN then {
				_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]]];
				if !(_isActivated) exitWith {};
				sleep 1;
				UO_FW_AI_EXEC_CHECK(SERVERHC)
				//Check if should disable/enable linked zones or do nothing. default: do nothing
				switch (_logic getVariable ["UO_FW_AI_ControlInitAction",0]) do {
					case 1 : {
						// Disable Linked Zones
						[([_logic,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call UO_FW_AI_fnc_getSyncedModules),1] call UO_FW_AI_fnc_setZone;
					};
					case 2 : {
						// Enable Linked Zones
						[([_logic,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call UO_FW_AI_fnc_getSyncedModules),0] call UO_FW_AI_fnc_setZone;
					};
					default {};
				};
				//Setup Control Module as Zone
				_cond = _logic getVariable ["UO_FW_AI_ControlCondition","false"];
				if(typename _cond isEqualTo "STRING") then {_cond = compile _cond;};
				_code = _logic getVariable ["UO_FW_AI_ControlCode","true"];
				if(typename _code isEqualTo "STRING") then {_code = compile _code;};
				_isRectangle = if((typeof _logic) isEqualTo "UO_FW_AI_ControlModule_R") then {true} else {false};
				UO_FW_AI_Zones pushBack [
					_logic,
					(getPosATL _logic),
					(_logic getVariable ["UO_FW_AI_ControlRadiusX",200]),
					(_logic getVariable ["UO_FW_AI_controlOn",0]),
					([_logic getVariable ["UO_FW_AI_ControlSide",0]] call UO_FW_AI_fnc_getSide),
					(UO_FW_AI_zoneTypes select (_logic getVariable ["UO_FW_AI_ControlType",1])),
					_cond,
					(_logic getVariable ["UO_FW_AI_ControlDelay",0]),
					_code,
					(_logic getVariable ["UO_FW_AI_ControlRadiusY",200]),
					_isRectangle,
					(getDir _logic),
					(_logic getVariable ["UO_FW_AI_ZoneHazard",false])
				];
				_entities = [_logic] call UO_FW_AI_fnc_getSyncedObjects;
				UO_FW_AI_entities pushBack [_logic,_entities];
				if(UO_FW_AI_DEBUG) then {
					_syncedZoneModule = [_logic,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call UO_FW_AI_fnc_getSyncedModules;
					if (_syncedZoneModule isEqualto []) then {
						(format["%1 a %2 has no Zone Modules linked.\nLink a Zone Module to the Enable/Disable the zone when the Control Module is activated.",_logic,typeof _logic]) call UO_FW_fnc_DebugMessage;
					};
					[_logic] spawn UO_FW_AI_fnc_debugSyncedModules;
				};

			};
		};
		case "attributesChanged3DEN": {
			_logic = _input param [0,objNull,[objNull]];
			private _radiusX = _logic getVariable ["UO_FW_AI_ControlRadiusX",_logic getVariable ["UO_FW_AI_ControlRadius", 100]];
			private _radiusY = _logic getVariable ["UO_FW_AI_ControlRadiusY",_logic getVariable ["UO_FW_AI_ControlRadius", 100]];
			set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
		};
		case "registeredToWorld3DEN": {};
		case "unregisteredFromWorld3DEN": {};
		case "connectionChanged3DEN": {};
		default {};
	};
	true
