#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);
if (!UO_FW_SERVER_COVERMAPMODULE_ALLOWED) exitWith {};
if (!UO_FW_CoverMap_Enable) exitWith {};

["Cover Map", "Covers map except specified area, allows switching between multiple AOs", "Blackhawk and PIZZADOX"] call UO_FW_FNC_RegisterModule;

if (!hasInterface) exitwith {};
[{!isNull player}, {
	private ["_DefaultAO"];
	if !((player getvariable ["UO_FW_CoverMap_UnitDefaultAO",""]) isEqualto "") then {
		_DefaultAO = player getvariable ["UO_FW_CoverMap_UnitDefaultAO",""];
		if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
			private _msg = format ["Default CoverMap for unit: %1 area: %1 does not exist!",player,_DefaultAO];
			UO_FW_DEBUG("",_msg);
		};
	} else {
		switch (side player) do {
			case west: {
				_DefaultAO = MissionNamespace getvariable ["UO_FW_CoverMap_DefaultAO_West",""];
				if (_DefaultAO isEqualto "") exitwith {
					UO_FW_DEBUG("","No Default BLUFOR Area defined for CoverMap!");
				};
				if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
					private _msg = format ["Default CoverMap BLUFOR area: %1 does not exist!",_DefaultAO];
					UO_FW_DEBUG("",_msg);
				};
			};
			case east: {
				_DefaultAO = MissionNamespace getvariable ["UO_FW_CoverMap_DefaultAO_East",""];
				if (_DefaultAO isEqualto "") exitwith {
					UO_FW_DEBUG("","No Default OPFOR Area defined for CoverMap!");
				};
				if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
					private _msg = format ["Default CoverMap OPFOR area: %1 does not exist!",_DefaultAO];
					UO_FW_DEBUG("",_msg);
				};
			};
			case resistance: {
				_DefaultAO = MissionNamespace getvariable ["UO_FW_CoverMap_DefaultAO_West",""];
				if (_DefaultAO isEqualto "") exitwith {
					UO_FW_DEBUG("","No Default INDFOR Area defined for CoverMap!");
				};
				if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
					private _msg = format ["Default CoverMap INDFOR area: %1 does not exist!",_DefaultAO];
					UO_FW_DEBUG("",_msg);
				};
			};
			case civilian: {
				_DefaultAO = MissionNamespace getvariable ["UO_FW_CoverMap_DefaultAO_Civ",""];
				if (_DefaultAO isEqualto "") exitwith {
					UO_FW_DEBUG("","No Default Civilian Area defined for CoverMap!");
				};
				if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
					private _msg = format ["Default CoverMap Civilian area: %1 does not exist!",_DefaultAO];
					UO_FW_DEBUG("",_msg);
				};
			};
			default {};
		};
	};

	UO_FW_CoverMap_currentAO = _DefaultAO;
	[_DefaultAO] call UO_FW_fnc_CoverMapBriefing;
	diag_log format ["UO_FW_CoverMap briefingfnc called: %1",_DefaultAO];

	[_DefaultAO] spawn {
		params ["_DefaultAO"];
		waituntil {visibleMap};
		[_DefaultAO] call UO_FW_fnc_CoverMapLive;
		diag_log format ["UO_FW_CoverMap live fnc called: %1",_DefaultAO];
	};
}] call CBA_fnc_waitUntilAndExecute;

[{(!isNull player) && {time > 1}}, {
	diag_log format ["UO_FW_CoverMap_AllowSwitching: %1",UO_FW_CoverMap_AllowSwitching];
	if (MissionNamespace getvariable ["UO_FW_CoverMap_AllowSwitching",false]) then {
		diag_log format ["UO_FW_CoverMap_AllowSwitching check passed: %1",UO_FW_CoverMap_AllowSwitching];
		diag_log format ["UO_FW_CoverMap_UnitAONameArray: %1",(player getvariable ["UO_FW_CoverMap_UnitAONameArray",[]])];
		if !((player getvariable ["UO_FW_CoverMap_UnitAONameArray",[]]) isEqualto []) then {
			diag_log format ["UO_FW_CoverMap_UnitAONameArray check passed: %1",(player getvariable ["UO_FW_CoverMap_UnitAONameArray",[]])];
			private _MapChangeMenu = ["MapChangeMenu", "Switch Map", "", {}, {true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions","ACE_Equipment"], _MapChangeMenu] call ace_interact_menu_fnc_addActionToObject;
			{
				private _AONameAllowed = _x;
				{
					_x params ["_AOName"];
					diag_log format ["UO_FW_CoverMap_AO_Array foreach _this: %1",_x];
					if (_AONameAllowed isEqualto _AOName) then {
						if (isNil "_AllowedCount") then {private _AllowedCount = 0;};
						private _condition = {
							params ["_target", "_player", "_params"];
							(visibleMap) && !(UO_FW_CoverMap_currentAO isEqualto (_params select 0)) && (MissionNamespace getvariable ["UO_FW_CoverMap_AllowSwitching",false])
						};
						private _statement = {
							params ["_target", "_player", "_params"];
							[(_params select 0)] call UO_FW_fnc_CoverMapLive;
						};
						private _actionName = format ["_MapChangeAction_%1",_AONameAllowed];
						private _tempAction = ["switch_MapAO", ("Switch Map to " + _AONameAllowed), "", _statement, _condition, {}, [_AONameAllowed]] call ace_interact_menu_fnc_createAction;
						MissionNamespace setvariable [_actionName,_tempAction];
						[player, 1, ["ACE_SelfActions","ACE_Equipment","MapChangeMenu"], (MissionNamespace getvariable _actionName) ] call ace_interact_menu_fnc_addActionToObject;
						//call compile format ["
						//	private _condition = {(visibleMap) && !(UO_FW_CoverMap_currentAO isEqualto %1) && (MissionNamespace getvariable ['UO_FW_CoverMap_AllowSwitching',false])};
						//	private _statement = {
						//		params ['_target', '_player', '_params'];
						//		[%1] call UO_FW_fnc_CoverMapLive;
						//	};
						//	private _MapChangeAction_%1 = ['switch_MapAO', 'Switch Map to %1', '', _statement, _condition] call ace_interact_menu_fnc_createAction;
						//	[player, 1, ['ACE_SelfActions','ACE_Equipment','MapChangeMenu'], _MapChangeAction_%1] call ace_interact_menu_fnc_addActionToObject;
						//",_AONameAllowed,_AOName];
						_AllowedCount = _AllowedCount + 1;
						diag_log format ["CoverMap action added for area: %1",_AONameAllowed];
					};
				} foreach UO_FW_CoverMap_AO_Array;
			} foreach UO_FW_CoverMap_UnitAONameArray;
		};
	};
}] call CBA_fnc_waitUntilAndExecute;
