/*	Description: Task Module initialisation creates the zone.
 *	Arguments:
 * 		OBJECT	- Module (name, _logic)
 *		ARRAY	- Units (synced to module)
 *		BOOL	- Module Activated
 * 	Return Value:
 * 		BOOL	- True
 *	Author
 *		suits & PiZZADOX & Lecks
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params [["_mode","",[""]],["_input",[],[[]]]];
	if(isNil "UO_FW_AI_initialised") then {call UO_FW_AI_fnc_init;};
	switch _mode do {
		case "init": {
			if !is3DEN then {
				if (isMultiplayer) then {
					waituntil {!isNil "UO_FW_var_HC_ID"};
				};
				_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]]];
				if !(_isActivated) exitWith {};
				sleep 0.25;

				if(count ([_logic ,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call UO_FW_AI_fnc_getSyncedModules) > 0 ) then {
					_logic setVariable["UO_FW_AI_taskZoneActivated",true];
				};

				[_logic] spawn UO_FW_AI_fnc_debugSyncedModules;
			};
		};
		case "attributesChanged3DEN": {
			private _logic = _input param [0,objNull,[objNull]];
			private _radius = (_logic getVariable ["UO_FW_AI_taskRadius",100]);
      private _area = _logic get3DENAttribute "size2";
      set3DENAttributes [[[_logic],"size2",[_radius,_radius]]];
		};
	};
	true
